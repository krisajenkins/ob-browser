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
  (let* ((file "/Users/kris/.emacs.d/kaj/ob-phantomjs/ob-phantomjs.js")
	 (out "/Users/kris/.emacs.d/kaj/ob-phantomjs/test.png")
	 (cmd (format "phantomjs %s %s" file out)))
    (org-babel-eval cmd body)
    out))

;;;###autoload
(eval-after-load "org"
 '(add-to-list 'org-src-lang-modes '("phantomjs" . html)))

(provide 'ob-phantomjs)
