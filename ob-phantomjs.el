;;; ob-phantomjs.el --- Translation of text blocks in org-mode.
;; Copyright 2013 Kris Jenkins

;; Author: Kris Jenkins <krisajenkins@gmail.com>
;; Maintainer: Kris Jenkins <krisajenkins@gmail.com>
;; Keywords: org babel phantomjs
;; URL: https://github.com/krisajenkins/ob-phantomjs
;; Created: 24th July 2013
;; Version: 0.1.0
;; Package-Requires: ((org "8"))

;;; Commentary:
;;
;; Render HTML in org-mode blocks.

;;; Code:
(require 'org)
(require 'ob)

(defvar ob-phantomjs-base-dir (file-name-directory load-file-name))

(defgroup ob-phantomjs nil
  "Render HTML in org-mode blocks."
  :group 'org)

;;;###autoload
(defvar org-babel-default-header-args:phantomjs
  '((:results . "file")
    (:exports . "results"))
  "Default arguments for evaluating a phantomjs source block.")

;;;###autoload
(defun org-babel-execute:phantomjs (body params)
  "Execute a phantomjs block."
  (let* ((driving-script (concat ob-phantomjs-base-dir "ob-phantomjs.js"))
	 (out (or (cdr (assoc :out params))
	 	  (error "phantomjs code blocks require a :out header argument")))
	 (cmd (format "phantomjs %s %s" driving-script out)))
    (org-babel-eval cmd body)
    out))

;;;###autoload
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

;;;###autoload
(eval-after-load "org"
  '(add-to-list 'org-src-lang-modes '("phantomjs" . html)))

(provide 'ob-phantomjs)

;;; ob-phantomjs.el ends here
