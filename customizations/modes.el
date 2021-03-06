; mouse support for console mode
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(unless window-system
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))

; Git
(require 'magit)
(autoload 'magit-status "magit" nil t)
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)

; Ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

; scala
(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-to-list 'load-path "~/.emacs.d/vendor/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

; markdown
(autoload 'markdown-mode "markdown-mode"
          "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

; asciidoc
(add-to-list 'load-path "~/.emacs.d/vendor/doc-mode-1.1/")
(autoload 'doc-mode "doc-mode" nil t)

;; ido-mode stuff
;(setq ido-use virtual-buffers t)

; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

; gambit
(require 'gambit)

; tuareg
;(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
;(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
;(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
;  (add-to-list 'completion-ignored-extensions ext))

; sml-mode
(add-to-list 'load-path "~/.emacs.d/vendor/sml-mode-4.1")
(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
(autoload 'run-sml "sml-proc" "Run an inferior SML process." t)
;(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode)
