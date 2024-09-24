%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
	#include <ctype.h>

    



    const char* varlistSeperator = ",";
    const char* NOVAR = "";

    char* setVars[100] = {NULL};
    size_t setCount = 0;
    char* locVars[100] = {NULL};
    size_t locCount = 0;

    char* axioms[100] = {NULL};
    size_t axiomCount = 0;
    char* conjectures[10] = {NULL};
    size_t conjectureCount = 0;

    char *takenVarNames[] = {"C", "Z"};
    size_t takenVarNamesLength = 2;

    void printStringArray(char* stringArray[], size_t arrayLength) {
        for (size_t i = 0; i < arrayLength; i++) {
            printf("%zu: %s\n", i, stringArray[i]);
        }
    }

    void printLocVars() {
        printStringArray(locVars, locCount);
    }

    
    void printSetVars() {
        printStringArray(setVars, setCount);
    }

    void yyerror(char* msg);

    char* buildQuantifiedFormula(char* quant, char* varlist, char* formula);
    char* strcatN(char* a[], int l);
    char* strcatNDel(char* a[], int l, char* del);
    char* elementOf(char* s1, char* s2);
    int containsString(char* stringArray[], size_t arrayLength, char* searchString);
    int removeFromLoc(char* var);
    int removeFromSet(char* var);
    int isLoc(char* var);
    void setTypeLoc(char* var);
    void setTypeSet(char* var);
    char* componentOf(char* prefix, char* var);
    char* objectOf(char* var);
    char* fieldOf(char* var);
    char** split(const char* str, char delimiter, size_t* count);
    char* buildQuantifiedFormula(char* quant, char* varlist, char* formula);
    char* generateConstants();
    char* generateSequence(int withAxioms);
    char* generateKeyFileContent(int wA);
    void addAxiom(char* axiom);
    void addConjecture(char* con);
    char* singletonGen(char* var);
    char* keyName(char* var);


    extern int yylex();


%}
%union {
    char c;
    char *str;
}
%start fof_annotated_list
%token <str> identifier and or equiv impl not 
%token <str> axiom conjecture
%token <str> un intersection difference empty_set universal_class complement symmetric_difference
%token <str> subset disjoint equal not_equal equal_set member intersect eq_infix uneq_infix empty unordered_pair singleton

%type <str> fof_annotated 
            fof_annotated_list
            fof_formula 
            fof_formula_tail
            fof_unary_formula
            fof_infix_unary
            fof_unit_formula
            fof_unitary_formula
            fof_quantified_formula
            fof_atom
            quantor_variables
            set_term
            loc_term
            fof_varlist
            fof_quantifier
            variable
            fof_annotated_ignore
            fof_annotated_interesting

%%

fof_annotated_list          : fof_annotated fof_annotated_list                                 {;}
                            | fof_annotated                                                     {printf("%s\n", generateKeyFileContent(0));}
                            ;

fof_annotated				: fof_annotated_ignore fof_annotated_interesting	   {;}
							;

fof_annotated_ignore        : identifier '(' identifier ','             {;}
                            ;

fof_annotated_interesting   : axiom ',' fof_formula  ')' '.'            { addAxiom(strdup($3));}
                            | conjecture ',' fof_formula  ')' '.'       { addConjecture(strdup($3));}
                            ;

fof_formula           		: fof_unit_formula fof_formula_tail                 { char* strings[] = {strdup($1), strdup($2)};$$ = strcatN(strings, 2);}
                            ;

fof_formula_tail 			: and fof_formula           {char* strings[] = {" & ", strdup($2)}; $$ = strcatN(strings, 2);} /*muss anscheinend so hacky, sonst segfault*/
                            | or fof_formula            { char* strings[] = {" | ", strdup($2)}; $$ = strcatN(strings, 2);}  
                            | equiv fof_formula            { char* strings[] = {" <-> ", strdup($2)}; $$ = strcatN(strings, 2);}
                            | impl fof_formula            { char* strings[] = {" -> ", strdup($2)}; $$ = strcatN(strings, 2);}                 
							|                          {$$ = "";}         
							;

fof_unit_formula      		: fof_unitary_formula  		{$$ = $1;}													
					  		| fof_unary_formula 		{$$ = $1;}													
							;

fof_unitary_formula   		: fof_quantified_formula 							{$$ = $1;}						
					  		| fof_atom 								{ $$ = $1;}							
					  		| '(' fof_formula ')'			{char* strings[] = {"(", strdup($2), ")"}; $$ = strcatN(strings, 3);}											
							;

fof_unary_formula     		: not  fof_unit_formula  	{char* strings[] = {"!", $2}; $$ = strcatN(strings, 2);}										
							| set_term fof_infix_unary 			{char* strings[] = {$1, $2}; $$ = strcatN(strings, 2);}										
							;

fof_infix_unary       		: uneq_infix  set_term 	{char* strings[] = {" != ", $2}; $$ = strcatN(strings, 2);}	
                            | eq_infix set_term   {char* strings[] = {" = ", $2}; $$ = strcatN(strings, 2);}
							;


fof_quantified_formula  	: fof_quantifier  quantor_variables ':' fof_formula		{ $$ = buildQuantifiedFormula($1, $2, $4);}		            
							;

fof_atom 					: subset '(' set_term  ',' set_term ')' 				{ char* strings[] = {"subset(", strdup($3), ",", strdup($5), ")"}; $$ = strcatN(strings, 5);}		
							| not_equal '(' set_term ',' set_term ')' 				{ char* strings[] = {"(", strdup($3), "!=", strdup($5), ")"}; $$ = strcatN(strings, 5);}
							| equal_set '(' set_term ',' set_term ')' 				{ char* strings[] = {"(", strdup($3), "=", strdup($5), ")"}; $$ = strcatN(strings, 5);}		
							| disjoint '(' set_term ',' set_term ')' 				{ char* strings[] = {"disjoint(", strdup($3), ",", strdup($5), ")"}; $$ = strcatN(strings, 5);}
							| member '(' loc_term ',' set_term ')' 					{ $$ = elementOf($3, $5);}
							| intersect '(' set_term ',' set_term ')' 	            { char* strings[] = {"!disjoint(", strdup($3), ",", strdup($5), ")"}; $$ = strcatN(strings, 5);}
                            | empty '(' set_term ')'			                    { char* strings[] = {"empty = ", strdup($3)}; $$ = strcatN(strings, 2);}
                            ;

quantor_variables           : '[' variable fof_varlist                              {char* strings[] = {$2, $3};$$ = strcatN(strings, 2);}
                            ;

loc_term 					: variable 						                        {setTypeLoc($1); $$ = $1;}
							;

set_term 					: un '(' set_term ',' set_term ')' 						{char* strings[] = {"union(", strdup($3), ",", strdup($5), ")"}; $$ = strcatN(strings, 5);}
							| intersection '(' set_term ',' set_term ')' 			{char* strings[] = {"intersect(", strdup($3), ",", strdup($5), ")"}; $$ = strcatN(strings, 5);}
							| difference '(' set_term ',' set_term ')'              {char* strings[] = {"setMinus(", strdup($3), ",", strdup($5), ")"}; $$ = strcatN(strings, 5);}	
                            | symmetric_difference '(' set_term ',' set_term ')'    {char* strings[] = {"union(setMinus(", strdup($3), ",", strdup($5), "), setMinus(",strdup($5), ",", strdup($3), "))"}; $$ = strcatN(strings, 9);}	
                            | complement '(' set_term ')'           				{char* strings[] = {"setMinus(allLocs ,", strdup($3), ")"}; $$ = strcatN(strings, 3);}
                            | unordered_pair '(' loc_term ',' loc_term ')'	        {char* strings[] = {"union(", singletonGen($3) ,",", singletonGen($5) ,")"}; $$ = strcatN(strings, 5);}
                            | empty_set                                             {$$= "empty";}
                            | singleton '(' loc_term ')'                			{ $$ = singletonGen($3);}               
                            | universal_class                                       {$$ = "allLocs";}
                            | variable 				                                {setTypeSet($1); $$ = $1;}	
							;




fof_varlist     			: ']'		                            {$$ = "";}												
							| ',' variable fof_varlist 	            {char* strings[] = {strdup(varlistSeperator),$2, $3};$$ = strcatN(strings, 3);}											
							;

fof_quantifier              : '!'          {$$ = "\\forall ";}                                                          
                            | '?'           {$$ = "\\exists ";}                                                        
                            ;


variable                    : identifier                    { $$ = keyName($1);}                                                    
                            ;

%%
void yyerror(char* msg) {
    fprintf(stderr, "%s\n", msg);
    exit(1);
}
char* keyName(char* var) {
    if(containsString(takenVarNames, takenVarNamesLength, var)) {
        return strcat(var, "0");
    }
    return var;
}

char* elementOf(char* loc, char* set) {
    char* strings[] = {"elementOf(", objectOf(loc), "," , fieldOf(loc), ",", set, ")"};
    return  strcatN(strings, 7);
}

char* singletonGen(char* var) {
    char* strings[] = {"singleton(", objectOf(var), ",", fieldOf(var), ")"};
    return strcatN(strings, 5);
}

char* strcatNDel(char** strings, int length, char* delimiter) {
    if(length == 0) {
        return "";
    }
    // Calculate the total length of the concatenated string
    size_t totalLength = 0;
    for (int i = 0; i < length; i++) {
        totalLength += strlen(strings[i]);
    }
    // Add space for delimiters
    totalLength += (length - 1) * strlen(delimiter) + 1;

    // Allocate memory for the concatenated string
    char* result = (char*)malloc(totalLength * sizeof(char));
    if (result == NULL) {
        printStringArray(strings, length);
        printf("params %d %s", length, delimiter);
        fprintf(stderr, "AMemory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    // Concatenate strings with delimiter
    strcpy(result, strings[0]);
    for (int i = 1; i < length; i++) {
        strcat(result, delimiter);
        strcat(result, strings[i]);
    }

    return result;
}
char* strcatN(char** strings, int length) {
    return strcatNDel(strings, length, "");
}

int containsString(char* stringArray[], size_t arrayLength, char* searchString) {
    for (size_t i = 0; i < arrayLength; i++) {
        if (strcmp(stringArray[i], searchString) == 0) {
            return 1; // String found in the array
        }
    }
    return 0; // String not found in the array
}

int removeFromLoc(char* var) {
    for (size_t i = 0; i < locCount; i++)
    {
        if(strcmp(locVars[i], var) == 0) {
            locVars[i] = strdup(NOVAR);
        }
    }
    
}

int removeFromSet(char* var) {
    for (size_t i = 0; i < setCount; i++)
    {
        if(strcmp(setVars[i], var) == 0) {
            setVars[i] = strdup(NOVAR);
        }
    }
    
}

int isLoc(char* var) {
    return containsString(locVars, locCount, var);
}

int isSet(char* var) {
    return containsString(setVars, setCount, var);
}


void setTypeLoc(char* var) {
    if(isSet(var)) {
        fprintf(stderr, "Type conflict: %s\n", var);
        exit(EXIT_FAILURE);
    }
    if(!isLoc(var)){
        locVars[locCount] = var;
        locCount++;
    }
}

void setTypeSet(char* var) {
    if(isLoc(var)) {
        fprintf(stderr, "Type conflict: %s\n", var);
        exit(EXIT_FAILURE);
    }
    if(!isSet(var)){
        setVars[setCount] = var;
        setCount++;
    }
}



char* componentOf(char* prefix, char* var) {
    char* res = (char*) malloc(sizeof(prefix) + sizeof(var) );
    strcat(res, prefix);
    strcat(res, var);
    return res;
}

char* objectOf(char* var) {
    return componentOf("o_", var);
}

char* fieldOf(char* var) {
    return componentOf("f_", var);
}


char** split(const char* str, char delimiter, size_t* count) {
    // Count the number of substrings
    if(strlen(str) == 0) {
        return NULL;
    }
    *count = 1; // at least one substring
    for (const char* p = str; *p; ++p) {
        if (*p == delimiter) {
            (*count)++;
        }
    }

    // Allocate memory for the array of pointers
    char** substrings = malloc(*count * sizeof(char*));
    if (!substrings) {
        printf("%s %ld %c", str, *count, delimiter);
        fprintf(stderr, "XMemory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    // Copy substrings into the array
    size_t index = 0;
    const char* start = str;
    for (const char* p = str; ; ++p) {
        if (*p == delimiter || *p == '\0') {
            size_t length = p - start;
            substrings[index] = malloc((length + 1) * sizeof(char));
            if (!substrings[index]) {
                printf("%s %ld %c", str, *count, delimiter);
                fprintf(stderr, "YMemory allocation failed\n");
                exit(EXIT_FAILURE);
            }
            strncpy(substrings[index], start, length);
            substrings[index][length] = '\0';
            index++;
            if (*p == '\0') {
                break;
            }
            start = p + 1;
        }
    }

    return substrings;
}

char* buildQuantifiedFormula(char* quant, char* varlist, char* formula) {
    const char* defaultSort = " Object ";
    size_t countVars;
    char** varlistSplit = split(varlist, varlistSeperator[0], &countVars);

    size_t sizeCB = strlen(varlist) * sizeof(char);
    size_t sizeOpening = strlen(varlist)*100 *sizeof(char);
    char* result = malloc(sizeOpening+ sizeof(formula) + sizeCB);
    char* closingBrackets = malloc(sizeCB*sizeof(char));

    if(result && closingBrackets){
        for(size_t i = 0;  i < countVars; i++) { 
            if(isLoc(varlistSplit[i])) {

                char* ov = objectOf(varlistSplit[i]);
                char* fv = fieldOf(varlistSplit[i]);
                strcat(result, quant);
                strcat(result, " Object ");
                strcat(result, strdup(ov));
                strcat(result, ";(");

                
                strcat(result, quant);
                strcat(result, " Field ");
                strcat(result,strdup(fv));
                strcat(result, ";(");



                strcat(closingBrackets, "))");
                removeFromLoc(varlistSplit[i]);
            } else if(isSet(varlistSplit[i])){
                strcat(result, quant);
                strcat(result, " LocSet ");
                strcat(result, strdup(varlistSplit[i]));
                strcat(result, ";(");

                strcat(closingBrackets, ")");
                removeFromSet(varlistSplit[i]);
            }
        }
    }
        
    char* strings[] = {result, formula, closingBrackets};
    char* realResult = strcatN(strings, 3);
    return realResult;
}

char* generateConstants() {

    char* res = (char*) malloc((locCount + setCount) * 100);
    strcat(res, "\\functions{ \n");

    for (size_t i = 0; i < setCount; i++)
    {
        if(strcmp(setVars[i], NOVAR) != 0) {
            strcat(res, "\t LocSet ");
            strcat(res, setVars[i]);
            strcat(res, ";\n");

        }
    }
    for (size_t i = 0; i < locCount; i++)
    {
        if(strcmp(locVars[i], NOVAR) != 0) {
            strcat(res, "\t Object ");
            strcat(res, objectOf(locVars[i]));
            strcat(res, ";\n");

            strcat(res, "\t Field ");
            strcat(res, fieldOf(locVars[i]));
            strcat(res, ";\n");
        }

    }

    strcat(res, "}\n");
    return res;
}



void addAxiom(char* axiom) {
    axioms[axiomCount] = axiom;
    axiomCount++;
}

void addConjecture(char* con) {
    conjectures[conjectureCount] = con;
    conjectureCount++;
}

char* generateSequence(int withAxioms) {
    char * axiomString;
    if(withAxioms == 1) {
        axiomString = strcatNDel(axioms, axiomCount, ", ");
    } else {
        axiomString = "";
    }
    
    char* conjectureString = strcatNDel(conjectures, conjectureCount, ", ");

    char* prbArray[] = {"\\problem{\n\t", axiomString, " ==> ", conjectureString, "\n}"};
    char* sequence = strcatN(prbArray, 5);
    return sequence;
}

char* generateKeyFileContent(int withAxioms) {
    char* content = generateConstants();
    strcat(content, "\n\n\n");
    strcat(content, generateSequence(withAxioms));
    return strdup(content);
}

int main() {
    yyparse();
}