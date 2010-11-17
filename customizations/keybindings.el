; open file
(global-set-key [(super o)] 'find-file)

; close window
(global-set-key [(super w)]
                (lambda ()
                  (interactive)
                  (kill-buffer (current-buffer))))

; navigate through errors
(global-set-key [(meta n)] 'next-error)
(global-set-key [(meta p)] 'previous-error)

; easier nav between windows
(defun prev-window ()
  (interactive)
  (other-window -1))
(global-set-key "\033[5D" 'prev-window)
(global-set-key "\033[5C" 'other-window)

;; Faster point movement
(global-set-key "\M-\C-p" 
  '(lambda () (interactive) (previous-line 5)))
(global-set-key "\M-\C-n" 
  '(lambda () (interactive) (next-line 5)))

; easier access to commands
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

; delete more easily
;(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
