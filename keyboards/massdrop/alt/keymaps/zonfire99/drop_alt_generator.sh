#!/bin/zsh

#### FUNCTIONS ####
PS3="Please make a selection:  "

function colorCheck {
if test "$ColorR:u" = "RED"
    then
      ColorR=FF;
      ColorG=00;
      ColorB=00;
  elif test "$ColorR:u" = "GREEN"
    then
      ColorR=00;
      ColorG=FF;
      ColorB=00;
  elif test "$ColorR:u" = "BLUE"
    then
      ColorR=00;
      ColorG=00;
      ColorB=FF;
  elif test "$ColorR:u" = "CYAN"
    then
      ColorR=00;
      ColorG=FF;
      ColorB=FF;
  elif test "$ColorR:u" = "AQUA"
    then
      ColorR=00;
      ColorG=FF;
      ColorB=FF;
  elif test "$ColorR:u" = "PURPLE"
    then
      ColorR=80;
      ColorG=00;
      ColorB=80;
  elif test "$ColorR:u" = "PURPLE2"
    then
      ColorR=52;
      ColorG=02;
      ColorB=FF;
  elif test "$ColorR:u" = "MAGENTA"
    then
      ColorR=FF;
      ColorG=00;
      ColorB=FF;
  elif test "$ColorR:u" = "FUSCHIA"
    then
      ColorR=FF;
      ColorG=00;
      ColorB=FF;
  elif test "$ColorR:u" = "YELLOW"
    then
      ColorR=FF;
      ColorG=FF;
      ColorB=00;
  elif test "$ColorR:u" = "PINK"
    then
      ColorR=FF;
      ColorG=69;
      ColorB=B4;
  elif test "$ColorR:u" = "ORANGE"
    then
      ColorR=FF;
      ColorG=A5;
      ColorB=00;
  elif test "$ColorR:u" = "BROWN"
    then
      ColorR=A5;
      ColorG=2A;
      ColorB=A5;
  elif test "$ColorR:u" = "CHOCOLATE"
    then
      ColorR=D2;
      ColorG=69;
      ColorB=1E;
  elif test "$ColorR:u" = "OFF"
    then
      ColorR=00;
      ColorG=00;
      ColorB=00;
  elif test "$ColorR:u" = "WHITE"
    then
      ColorR=FF;
      ColorG=FF;
      ColorB=FF;
  elif test "$ColorR:u" = "LASER"
    then
      ColorR=FF;
      ColorG=00;
      ColorB=69;
  fi
  
}
function wholeBoard {
#if test "$ColorR:u" = Y || test "$ColorR:u" = YES
    echo "What color would you like?"
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
        colorCheck;
    fi
 
    for i in $(seq 0 66); do
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
   
    echo "Different underglow color?"
    select opt in Yes No; do
        case $opt in 
            Yes)
                echo "What color should it be?"
                read ColorR ColorG ColorB
                if test -z "$ColorG"
                    then
                        colorCheck;
                fi
                for i in $(seq 67 104); do
                    palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                done
                while true; do
                    echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
                    read "?Clipboard or File? [c/f] " cf
                    case $cf in
                        [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo "Enjoy!\nGoodbye.\n"; exit;;
                        [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo "Enjoy!\nGoodbye.\n"; exit;;
                        * ) echo "Please answer clipboard or file.";;
                    esac
                done
                ;;
            No)
                for i in $(seq 67 104); do
                    palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                done
                while true; do
                    echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
                    read "?Clipboard or File? [c/f] " cf
                    case $cf in
                        [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo "Enjoy!\nGoodbye.\n"; exit;;
                        [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo "Enjoy!\nGoodbye.\n"; exit;;
                        * ) echo "Please answer clipboard or file.";;
                    esac
                done
                ;;
        esac
    done 
}
function alternatingColors {
    echo "What is the first color?"
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    for i in $(seq 0 2 104); do
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    echo "What is the second color?"              
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    for i in $(seq 1 2 104); do
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
        while true; do
        echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
        read "?Clipboard or File? [c/f] " cf
        case $cf in
            [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo "Enjoy!\nGoodbye.\n"; exit;;
            [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo "Enjoy!\nGoodbye.\n"; exit;;
            * ) echo "Please answer clipboard or file.";;
        esac
    done
}
function rowsColors {
    echo "What color is the first row?"
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #0 14, 86 100
    for i in $(seq 0 14); do #row 1
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    for i in $(seq 86  100); do
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done


    echo "What color is the second row?"              
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #15 29, 85, 101
    for i in $(seq 15 29); do #row 2
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    palette="$palette \t\trgb_matrix_set_color(85, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    palette="$palette \t\trgb_matrix_set_color(101, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";


    echo "What color is the third row?"              
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #30 43, 84, 102
    for i in $(seq 30 43); do #row 3
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    palette="$palette \t\trgb_matrix_set_color(84, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    palette="$palette \t\trgb_matrix_set_color(102, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";


    echo "What color is the fourth row?"              
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #44 57, 83, 103
    for i in $(seq 44 57); do # row 4
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    palette="$palette \t\trgb_matrix_set_color(83, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    palette="$palette \t\trgb_matrix_set_color(103, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";


    echo "What color is the fifth row?"              
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #58 82, 104
    for i in $(seq 58 82); do #row 5
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    palette="$palette \t\trgb_matrix_set_color(104, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
 
    while true; do
        echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
        read "?Clipboard or File? [c/f] " cf
        case $cf in
            [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo "Enjoy!\nGoodbye.\n"; exit;;
            [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo "Enjoy!\nGoodbye.\n"; exit;;
            * ) echo "Please answer clipboard or file.";;
        esac
    done
}
function escColor {
    echo "What color would you like the ESC key? (NOTE: This will be your accent color)  "
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
}
function accentKeys {
    echo "Would you like more accent keys?"
    select opt3 in "Yes (ESC, Enter, Space, Arrows)" "No (ESC, Arrows)"; do
        case $opt3 in 
            "Yes (ESC, Enter, Space, Arrows)") 
                #more accent keys (esc, enter, space, arrows)
                #0, 42, 56, 61, 64 66
                moreAccentColors="true";
                palette="$palette \t\trgb_matrix_set_color(0, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                palette="$palette \t\trgb_matrix_set_color(42, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                palette="$palette \t\trgb_matrix_set_color(56, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                palette="$palette \t\trgb_matrix_set_color(61, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                for i in $(seq 64 66); do #
                    palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                done;
                #if more then outer is 1 15, 28 30, 43 44, 55, 57 60, 62, 63'
                return;
                ;;
            "No (ESC, Arrows)")
                #less accent keys (esc, arrows)
                #0, 56, 64 66
                moreAccentColors="false";
                palette="$palette \t\trgb_matrix_set_color(0, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                palette="$palette \t\trgb_matrix_set_color(56, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                for i in $(seq 64 66); do #
                    palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                done;
                #if less then outer 1 15, 28 30,42, 43 44, 55, 57 60, 61, 62, 63
                return;
                ;;
            *)
                echo "Invalid option $REPLY";
                echo "Please make a selection:  \n1) Yes \n2) No";
                ;;
        esac
    done
}
function innerColor {
    echo "What color do you want the character keys? (Inner rows 1-3, not \|, Enter, Shift, or up arrow.) "
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #inner keys
    #16 27
    #30 41
    #45 54
    for i in $(seq 16 27); do #inner row 2, qwer...
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    for i in $(seq 31 41); do #inner row 3, asdf...
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    for i in $(seq 45 54); do #inner row 4, zxcv...
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
}
function outerKeys {
    echo "What color do you want the outer keys? "
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    if test "$moreAccentColors" = true; 
        then 
            #Outer keys (more)
            #1 15, 28 30, 43 44, 55, 57 60, 62, 63
            for i in $(seq 1 15); do #
                palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            done
                palette="$palette \t\trgb_matrix_set_color(28, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u); /// \\\| KEY \n";
                palette="$palette \t\trgb_matrix_set_color(29, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                palette="$palette \t\trgb_matrix_set_color(30, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                palette="$palette \t\trgb_matrix_set_color(43, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                palette="$palette \t\trgb_matrix_set_color(44, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                palette="$palette \t\trgb_matrix_set_color(55, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            for i in $(seq 57 60); do #
                palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            done
            palette="$palette \t\trgb_matrix_set_color(61, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u); /// SPACE BAR KEY \n";
            palette="$palette \t\trgb_matrix_set_color(62, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            palette="$palette \t\trgb_matrix_set_color(63, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                
    elif test "$moreAccentColors" = false; 
        then 
            #Outer keys (less)
            #1 15, 28 30, 43, 44, 55, 57 63
            for i in $(seq 1 15); do #
                palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            done
            for i in $(seq 28 30); do #
                palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            done
            palette="$palette \t\trgb_matrix_set_color(42, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            palette="$palette \t\trgb_matrix_set_color(43, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            palette="$palette \t\trgb_matrix_set_color(44, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            palette="$palette \t\trgb_matrix_set_color(55, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            for i in $(seq 57 60); do #
                palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            done
            palette="$palette \t\trgb_matrix_set_color(61, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u); /// SPACE BAR KEY \n";
            palette="$palette \t\trgb_matrix_set_color(62, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
            palette="$palette \t\trgb_matrix_set_color(63, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";

    fi
}
function alternatingUnderglowColors {
    echo "What is the first color?"
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    for i in $(seq 67 2 104); do
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    echo "What is the second color?"
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    for i in $(seq 68 2 104); do
    palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    while true; do
        echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
        read "?Clipboard or File? [c/f] " cf
        case $cf in
            [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo "Enjoy!\nGoodbye.\n"; exit;;
            [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo "Enjoy!\nGoodbye.\n"; exit;;
            * ) echo "Please answer clipboard or file.";;
        esac
    done
}
function UnderglowSections {
    echo "What is the bottom color?"
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #bottom 
    #67 81
    for i in $(seq 67 81); do #
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done 
    echo "What is the left side color?"              
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #left 
    # 101 104
    for i in $(seq 101 104); do #
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done    
    echo "What is the top color?"
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #top 
    # 86 100
    for i in $(seq 86 100); do #
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done
    echo "What is the right side color?"
    read ColorR ColorG ColorB
    if test -z "$ColorG"
        then
            colorCheck;
    fi
    #right
    # 82 85
    for i in $(seq 82 85); do #
        palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
    done  
    while true; do
        echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
        read "?Clipboard or File? [c/f] " cf
        case $cf in
            [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo "Enjoy!\nGoodbye.\n"; exit;;
            [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo "Enjoy!\nGoodbye.\n"; exit;;
            * ) echo "Please answer clipboard or file.";;
        esac
    done
}
function UnderglowColors {
        echo "Underglow colors?"
            select opt4 in All Sections Alternating; do
                case $opt4 in 
                    All)
                        echo "What color should it be?"
                        read ColorR ColorG ColorB
                        if test -z "$ColorG"
                            then
                                colorCheck;
                        fi
                        for i in $(seq 67 104); do
                            palette="$palette \t\trgb_matrix_set_color($i, 0x$ColorR:u, 0x$ColorG:u ,0x$ColorB:u);\n";
                        done
                        while true; do
                            echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
                            read "?Clipboard or File? [c/f] " cf
                            case $cf in
                                [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo "Enjoy!\nGoodbye.\n"; exit;;
                                [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo "Enjoy!\nGoodbye.\n"; exit;;
                                * ) echo "Please answer clipboard or file.";;
                            esac
                        done
                        ;;
                    Sections)
                        UnderglowSections

                        while true; do
                            echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
                            read "?Clipboard or File? [c/f] " cf
                            case $cf in
                                [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo Enjoy!; echo ; echo "Goodbye."; exit;;
                                [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo Enjoy!; echo ; echo "Goodbye."; exit;;
                                * ) echo "Please answer clipboard or file.";;
                            esac
                        done
                        ;;
                    Alternating)
                        alternatingUnderglowColors

                        while true; do
                            echo " I recommend a file if there is something that script hasn't covered with your wants/needs."
                            read "?Clipboard or File? [c/f] " cf
                            case $cf in
                                [Cc]* ) echo "$beginning $(echo $palette | sort -V)\n $end" | pbcopy; echo "Enjoy!\nGoodbye.\n"; exit;;
                                [Ff]* ) echo "$beginning $(echo $palette | sort -V)\n $end" > $profile\_rgb\_matrix\.txt; echo "Enjoy!\nGoodbye.\n"; exit;;
                                * ) echo "Please answer clipboard or file.";;
                            esac
                        done
                        ;;
                        *)
                            echo "Invalid option $REPLY"
                            echo "Please make a selection:  \n1) All \n2) Sections \n3) Alternating"
                            ;;
            esac
        done 
}


#profile name, includes workaround for 'case' not knowing full RegEx
while true; do
    read "?What is the name of your profile? (Accepted characters: [a-zA-Z0-9_]) " profile 
    beginning="RGB_MATRIX_EFFECT(RGB_CUSTOM_$profile:u)///MOVE THIS LINE TO YOUR IMPORTS OR INC LINE. USUALLY IN THE FIRST 10 LINES\n
static bool RGB_CUSTOM_$profile:u(effect_params_t* params) {
    RGB_MATRIX_USE_LIMITS(led_min, led_max);
        for (uint8_t i = led_min; i < led_max; i++) {"
    end="\t}
    return led_max < DRIVER_LED_TOTAL;
}"

    if [[ $profile =~ [^0-9a-zA-Z_\s] ]]
        then 
            GBU=B
    elif [[ $profile =~ [0-9a-zA-Z_] ]]
        then
            GBU=G
    fi
    case $GBU in
        G ) echo "OK, \"$profile\" it is then. "; break;;
        B ) echo "Nah uh uh. You didn't say the magic word. Try again.";;
    esac
done
echo "You may use HEX color values [00 ff 00] or your color options are:\n\nRED\tGREEN\tBLUE\tCYAN\nAQUA\tPURPLE\tPURPLE2\tMAGENTA\nFUSCHIA\tYELLOW\tPINK\tORANGE\nBROWN\tCHOCOLATE\tLASER\nWHITE\tOFF"
echo "Would you like something Simple or Complex? "
select opt in Simple Complex Quit; do
    case $opt in
        Simple)
            select opt2 in Rows Alternating "Whole board" back; do
                case $opt2 in 
                    Rows)
                        rowsColors
                        ;;
                    Alternating)
                        alternatingColors;
                        ;;
                    "Whole board")
                        wholeBoard
                        ;;
                    back) 
                        echo "Would you like something Simple or Complex?\n 1) Simple \n 2) Complex \n3) Quit"
                        break;;
                    *)
                        echo "Invalid option $REPLY"
                        echo "Please make a selection:  \n1) Simple \n2) Complex \n3) Quit"
                        ;;
                esac
            done
        ;;
        Complex)
            escColor
            accentKeys
            innerColor
            outerKeys
            UnderglowColors #must be last.
            ;;
        Quit) 
            exit
            ;;
        *) 
            echo "Invalid option $REPLY"
            echo "Please make a selection:  \n1) Simple \n2) Complex \n3) Quit"
            ;;
    esac
done