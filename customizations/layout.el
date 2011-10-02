(defun emacs-save-layout ();TODO: handle eshell
  "save the frame and window layout to ~/.emacs-layout. Requires revive.el."
(interactive)
(let ((out-name "~/.emacs-layout")
      (frames (frame-list))
      (configs nil)
      (buffs (sorted-buffer-list))
      (filtered-buffs nil)
      (s-buffs nil))
  (dolist (b buffs)    
      (let ((file-name (buffer-file-name b)))
        (when (and file-name
                   (> (length file-name) 0))
          (setq filtered-buffs (cons file-name filtered-buffs)))))
  (when filtered-buffs (setq filtered-buffs (reverse filtered-buffs)))
  (dolist (frame frames)
    (select-frame frame)
    (setq configs (cons (current-window-configuration-printable) configs)))
  (setq configs (cons filtered-buffs configs))
  (write-region (with-output-to-string (prin1 configs)) nil out-name)))

(defun emacs-load-layout ();TODO: handle eshell buffers.
  "Load the layout saved by emacs-save-layout. Requires revive.el."
(interactive)
(let* ((in-name "~/.emacs-layout")
      (config-count 0)
      (frames (frame-list))
      (configs nil)
      (frame-count (length frames))
      (buffs nil))
  (with-temp-buffer
    (insert-file-contents-literally in-name)
    (setq buffs (read (current-buffer)))
    (setq configs (rest buffs))
    (setq buffs (first buffs)))
  (dolist (b buffs)
    (find-file-noselect b)
    (message "Loading buffer %s" b))
  (setq config-count (length configs))
  (message "Config count is %s" config-count)
  (unless (>= frame-count config-count)
    (dotimes (i (- config-count frame-count))
      (make-frame))
    (setq frames (frame-list))
    (setq frame-count (length frames))
    (message "frame-count is %s" frame-count))
  (defun it (lconfigs lframes)
            (when (and lconfigs lframes)
              (select-frame (first lframes))
              (restore-window-configuration (first lconfigs))
              (it (rest lconfigs) (rest lframes))))
  (it configs frames)))

