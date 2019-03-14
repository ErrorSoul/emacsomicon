(defun x-make-word-red (begin end)
  "make current region colored red, using text properties"
  (interactive "r")
  (put-text-property begin end 'font-lock-face '(:foreground "red")))
(message "dfdf %s" (string-equal system-type "darwin"))

(defun xah-mouse-click-to-search (@click)
  "Mouse click to start `isearch-forward-symbol-at-point' (emacs 24.4) at clicked point.
URL `http://ergoemacs.org/emacs/emacs_mouse_click_highlight_word.html'
Version 2016-07-18"
  (interactive "e")
  (message "dfdfsdfsdffds")
  (let ((p1 (posn-point (event-start @click))))
    (goto-char p1)
    (isearch-forward-symbol-at-point)))


(cond
 ((string-equal system-type "windows-nt") ; Windows
  nil
  )
 ((string-equal system-type "gnu/linux")
  (global-set-key (kbd "<mouse-3>") 'xah-click-to-search) ; right button
  )
 ((string-equal system-type "darwin") ; Mac
  (global-set-key (kbd "<mouse-3>") 'xah-mouse-click-to-search) ;
  ) )




(defun my-open-proj ()
  (interactive)
  (message "run start")
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (let ((files (clean-files-list (directory-files "~/works/uchiru-login/"))))
    ;;(mapc (lambda (x) (insert x) (insert "\n")) files)
    (insert-file-lines files)
    )

  (setq moreLines t )
  (goto-char (point-min))
  (while moreLines
    (setq fName (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
    (insert (format "name is %s \n" fName))
    (insert (format "%s is %s \n" fName (file-directory-p fName)))
    ;(put-text-property (line-beginning-position) (line-end-position) 'font-lock-face '(:foreground "blue"))
    (add-face-text-property  (line-beginning-position) (line-end-position)
                          '(:foreground "red"))

    (setq moreLines (= 0 (forward-line 1)))
    (insert (format "point is %s \n" (point)))
    )
)



(defun clean-files-list (pre-list)
  (remove-if
   (lambda (x) (or (equal x ".") (equal x "..")))
   pre-list)
  )



(defun insert-file-lines(files)
  (mapc (lambda (file) (insert file) (insert "\n")) files))



(message (buffer-file-name))



(defun rspec-file ()

  (interactive)
  (let ((file-name (buffer-file-name)))
    (message file-name)
    (cd "~/works/uchiru-login")
    (shell-command (format "rspec %s&" file-name))
    ))


(defun x-occur ()
  (interactive)
  (occur (current-word))
)

(defun yyy ()
  (interactive)
  (ag-files)
)
