/* Include the definitions to be used here */
%{
#include <stdio.h>
#include <string.h>

int line = 1;
FILE *output_file;

char* format_output(const char* type, const char* yytext, int line) {
    char* space0 = malloc(sizeof(char) * 20);
    int i = 0;
    for (; i < 19 - strlen(type); i++) {
        space0[i] = ' ';
    }
    space0[i] = '\0';

    char* space1 = malloc(sizeof(char) * 20);
    i = 0;
    for (; i < 19 - strlen(yytext); i++) {
        space1[i] = ' ';
    }
    space1[i] = '\0';

    char* output = malloc(sizeof(char) * 100);
    snprintf(output, 100, "%s%s%s%sLine %d\n", type, space0, yytext, space1, line);
    free(space0);
    free(space1);
    return output;
}

%}



/* Regular expression definitions that I use in the Lexical Analyzer*/
IDENTIFIER          [a-zA-Z_][a-zA-Z_0-9]*
KEYWORD             "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"
CONSTANT            [0-9]+(\.[0-9]+)?
STRING_LITERAL      \"[^\"]*\"
CHARACTER_CONSTANT  \'[^\']\'
OPERATOR            "+"|"-"|"*"|"/"|"%"|"<"|">"|"=="|"!="|"<="|">="|"&&"|"!"|"~"|"&"|"^"|"<<"|">>"|"\|"|"\|\|"|"="
PUNCTUATOR          "("|")"|"["|"]"|"{"|"}"|"."|","|";"|"?"
PREPROCESSOR        "#"
NEW_LINE            "\n"



/* In this section, the lexical analyzer rules are defined */
%%
{KEYWORD}               {
                            char* output = format_output("KEYWORD", yytext, line);
                            fputs(output, output_file);
                            fflush(output_file);
                            free(output);
                        }

{IDENTIFIER}            {
                            char* output = format_output("IDENTIFIER", yytext, line);
                            fputs(output, output_file);
                            fflush(output_file);
                            free(output);
                        }

{OPERATOR}              {
                            char* output = format_output("OPERATOR", yytext, line);
                            fputs(output, output_file);
                            fflush(output_file);    
                            free(output);
                        }

{CONSTANT}              {
                            char* output = format_output("CONSTANT", yytext, line);
                            fputs(output, output_file);
                            fflush(output_file);
                            free(output);
                        }

{STRING_LITERAL}        {
                            char* output = format_output("STRING_LITERAL", yytext, line);
                            fputs(output, output_file);
                            fflush(output_file);
                            free(output);
                        }

{CHARACTER_CONSTANT}    {
                            char* output = format_output("CHARACTER_CONSTANT", yytext, line);
                            fputs(output, output_file);
                            fflush(output_file);
                            free(output);
                        }

{PUNCTUATOR}            {
                            char* output = format_output("PUNCTUATOR", yytext, line);
                            fputs(output, output_file);
                            fflush(output_file);
                            free(output);
                        }

{PREPROCESSOR}          {
                            char* output = format_output("PREPROCESSOR", yytext, line);
                            fputs(output, output_file);
                            fflush(output_file);
                            free(output);
                        }

{NEW_LINE}              {
                            line++;
                            fprintf(output_file, "NEW LINE\n");
                            fflush(output_file);
                        }

<<EOF>>                 {
                            fprintf(output_file, "END OF FILE");
                            fflush(output_file);
                            return 0;
                        }

" "                     ;

.                       {
                            printf("IGNORED \"%s\" ON LINE %d\n", yytext, line);
                        }

%%



int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Missing input and/or output file(s)\n");
        return 1;
    }

    output_file = fopen(argv[2], "w");
    if (!output_file) {
        printf("Error opening output file\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error opening input file\n");
        return 1;
    }

    yylex();

    // Close the files
    fclose(yyin);
    fclose(output_file);

    return 0;
}