# mark.kak
# ----------------------------------------------------------------------------
# version:  1.0.1
# modified: 2017-12-15
# author:   fsub <31548809+fsub@users.noreply.github.com>
# rights:   UNLICENSE <http://unlicense.org/>
# ----------------------------------------------------------------------------

###
# declarations

declare-option -hidden bool mark_debug false

declare-option -hidden regex mark_regex_1
declare-option -hidden regex mark_regex_2
declare-option -hidden regex mark_regex_3
declare-option -hidden regex mark_regex_4
declare-option -hidden regex mark_regex_5
declare-option -hidden regex mark_regex_6

declare-option -hidden int-list mark_unused %{1:2:3:4:5:6}
declare-option -hidden int-list mark_active %{}

###
# faces

# for the time being, _ (underscore) is not admissible in face names 
set-face markface1 rgb:000000,rgb:FFA07A
set-face markface2 rgb:000000,rgb:FFFACD
set-face markface3 rgb:000000,rgb:B0E0E6
set-face markface4 rgb:000000,rgb:7CFC00
set-face markface5 rgb:000000,rgb:FFD700
set-face markface6 rgb:000000,rgb:E6E6FA

###
# highlighers

add-highlighter shared group mark
add-highlighter shared/mark dynregex '%opt{mark_regex_1}' 0:markface1
add-highlighter shared/mark dynregex '%opt{mark_regex_2}' 0:markface2
add-highlighter shared/mark dynregex '%opt{mark_regex_3}' 0:markface3
add-highlighter shared/mark dynregex '%opt{mark_regex_4}' 0:markface4
add-highlighter shared/mark dynregex '%opt{mark_regex_5}' 0:markface5
add-highlighter shared/mark dynregex '%opt{mark_regex_6}' 0:markface6

###
# hooks

# hack trying to override all other highlighting
hook -group mark global KakBegin .* %{ try %{
   hook -group mark global WinSetOption filetype=.* %{ try %{
      remove-highlighter window/mark
      add-highlighter window ref mark
}}}}

###
# definitions

define-command -hidden mark-debug-print-state %{
   %sh{
      case "${kak_opt_mark_debug}" in
         true|yes)
            printf "echo -debug [mark] unused:(%s) active:(%s)\\n" \
               "${kak_opt_mark_unused}" "${kak_opt_mark_active}"
            ;;
         *)
            ;;
      esac
   }
}

define-command -params 1..2 mark-set \
    -docstring %(mark-set <pattern> [slot]: highlight all text occurrences
matching <pattern>; unless [slot] is specified, use slot 1
   pattern: regular expression
   slot:    index in 1..6) \
%{
   %sh{
      mp="${1}"
      mi="${2-1}"

      case "${mi}" in
         1|2|3|4|5|6)
            ;;
         *)
            printf "echo -markup {Error}%s\\n" "invalid slot"
            exit
            ;;
      esac

      unset tu
      for i in $(printf %s "${kak_opt_mark_unused}" | tr : '\n'); do
         if [ "${i}" != "${mi}" ]; then
            tu="${tu}${tu+:}${i}"
         fi
      done
      printf "set-option global mark_unused '%s'\\n" "${tu}"

      unset ta
      for i in $(printf %s "${kak_opt_mark_active}" | tr : '\n'); do
         if [ "${i}" != "${mi}" ]; then
            ta="${ta}${ta+:}${i}"
         fi
      done
      ta="${ta}${ta+:}${mi}"
      printf "set-option global mark_active '%s'\\n" "${ta}"

      printf "mark-debug-print-state\\n"

      printf "set-option global mark_regex_%s '%s'\\n" "${mi}" "${mp}"
   }
}

define-command -params ..1 mark-del \
    -docstring %(mark-del [slot]: unmark all text occurrences highlighted via
mark-set at [slot]; unless [slot] is specified, use slot 1
   slot: index in 1..6) \
%{
   %sh{
      mi="${1-1}"

      case "${mi}" in
         1|2|3|4|5|6)
            ;;
         *)
            printf "echo -markup {Error}%s\\n" "invalid slot"
            exit
            ;;
      esac

      unset tu
      for i in $(printf %s "${kak_opt_mark_unused}" | tr : '\n'); do
         if [ "${i}" != "${mi}" ]; then
            tu="${tu}${tu+:}${i}"
         fi
      done
      tu="${mi}${tu+:}${tu}"
      printf "set-option global mark_unused '%s'\\n" "${tu}"

      unset ta
      for i in $(printf %s "${kak_opt_mark_active}" | tr : '\n'); do
         if [ "${i}" != "${mi}" ]; then
            ta="${ta}${ta+:}${i}"
         fi
      done
      printf "set-option global mark_active '%s'\\n" "${ta}"

      printf "mark-debug-print-state\\n"

      printf "set-option global mark_regex_%s ''\\n" "${mi}"
   }
}

define-command mark-clear \
   -docstring %(mark-clear: unmark all text occurrences highlighted via
mark-set) \
%{
   %sh{
      unset ta
      for i in $(printf %s "${kak_opt_mark_active}" | tr : '\n'); do
         ta="${i}${ta+:}${ta}"
      done
      tu="${kak_opt_mark_unused}"
      for i in $(printf %s "${ta}" | tr : '\n'); do
         tu="${i}${tu+:}${tu}"
         printf "set-option global mark_regex_%s ''\\n" "${i}"
      done
      printf "set-option global mark_unused '%s'\\n" "${tu}"
      printf "set-option global mark_active ''\\n"

      printf "mark-debug-print-state\\n"
   }
}

define-command -params 2 mark-pattern \
    -docstring %(mark-pattern <action> <pattern>: alter highlighting according
to <action> for all occurrences of text matching <pattern>
   action:  token in {del, set, toggle}
   pattern: regular expression) \
%{
   %sh{
      action="${1}"
      mp="${2}"

      case "${1}" in
         del|set|toggle)
            ;;
         *)
            printf "echo -markup {Error}%s\\n" "invalid action"
            exit
            ;;
      esac

      for i in $(printf %s "${kak_opt_mark_active}" | tr : '\n'); do
         case "${i}" in
            1)
               p="${kak_opt_mark_regex_1}"
               ;;
            2)
               p="${kak_opt_mark_regex_2}"
               ;;
            3)
               p="${kak_opt_mark_regex_3}"
               ;;
            4)
               p="${kak_opt_mark_regex_4}"
               ;;
            5)
               p="${kak_opt_mark_regex_5}"
               ;;
            6)
               p="${kak_opt_mark_regex_6}"
               ;;
            *)
               printf "echo -markup {Error}%s\\n" "invalid slot"
               exit
               ;;
         esac
         if [ "${p}" = "${mp}" ]; then
            if [ "${action}" != "set" ]; then
               printf "mark-del '%s'\\n" "${i}"
               action="del" # avoid setting again
            fi
         fi
      done

      if [ "${action}" != "del" ]; then
         if [ -z "${kak_opt_mark_unused}" ]; then
            for i in $(printf %s "${kak_opt_mark_active}" | tr : '\n'); do
               mi="${i}"
               break
            done
         else
            for i in $(printf %s "${kak_opt_mark_unused}" | tr : '\n'); do
               mi="${i}"
               break
            done
         fi
         printf "mark-set '%s' '%s'\\n" "${mp}" "${mi}"
      fi
   }
}

define-command -hidden mark-word-impl %{
   %sh{
      printf "mark-pattern toggle '\\\\b%s\\\\b'\\n" "${kak_selection}"
   }
}

define-command mark-word \
    -docstring %(mark-word: toggle highlighting for all occurrences of the
word under the cursor) \
%{
   %sh{
      tmp="${kak_opt_extra_word_chars}"
      printf "set-option current extra_word_chars ''\\n"
      printf "execute-keys -draft '%s'\\n" "<a-i>w:mark-word-impl<ret>"
      printf "set-option current extra_word_chars '%s'\\n" "${tmp}"
   }
}
