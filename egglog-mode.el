;;; egglog-mode.el --- Major mode for Egglog. -*- lexical-binding: t -*-

;; Copyright (C) 2024 Erik Post

;; Author   : Erik Post <erik@shinsetsu.nl>
;; Homepage : https://github.com/epost/egglog-mode
;; Version  : 0.1.0
;; Keywords : languages

;;; Commentary:

;; Emacs integration for working with egglog.

;;; Usage:

;; See README.org for instructions

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                            ;;
;; Customize                                                                  ;;
;;                                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgroup egglog nil
  "Major mode for working with egglog."
  :group 'languages)

;; re-evaluate using C-M-x
(defcustom egglog-egglog-command
  "egglog"
  "Path to 'egglog', the Egglog compiler."
  :group 'egglog
  :type 'string)

(define-derived-mode egglog-mode lisp-mode "egglog"
  "A mode for working with Egglog language models."

  ;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html
  (setq egglog-keywords
	'(("\\_<\\(sort\\|declare\\|datatype\\|relation\\|function\\|rewrite\\|rule\\|ruleset\\|union\\|set\\|delete\\|let\\|define\\)\\_>" . font-lock-keyword-face)
          ("\\_<\\(:merge\\|:cost\\:default\\|:when\\|:ruleset\\)\\_>" . font-lock-constant-face)
          ("\\_<\\(i64\\|f64\\|String\\|Vec\\|Map\\)\\_>" . font-lock-type-face)
          ("\\_<\\(min\\|max\\|old\\)\\_>" . font-lock-builtin-face)
          ("\\_<\\(check\\|fail\\|saturate\\|run\\|run-schedule\\|repeat\\|extract\\|query-extract\\|input\\)\\_>" . font-lock-builtin-face)
          ("\\_<\\(:until\\)\\_>" . font-lock-constant-face)
          ("\\=" . font-lock-constant-face)
		))

  (setq-local font-lock-defaults '(egglog-keywords)))

(provide 'egglog-mode)

;;; egglog-mode.el ends here
