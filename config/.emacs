;;configuration file for emacs
;;filename: ~/.emacs


(require 'package)
    (add-to-list 'package-archives
                 '("melpa-stable" . "https://stable.melpa.org/packages/"))
;;    (package-initialize)

;;(require 'package)
;;package manager (now only been used ot install gap-mode
;;(setq package-archives
;;      '(("melpa"     . "http://melpa.milkbox.net/packages/")
;;	("melpa-stable" . "https://stable.melpa.org/packages/")
;;      ("gnu"       . "http://elpa.gnu.org/packages/")))

(package-initialize)

;;this one is not in function yet
(add-to-list 'load-path "~/.emacs.d/external-el-package/")



;;bash config file
(add-to-list 'auto-mode-alist '(".bash*" . conf-unix-mode))

;; cpp mode for .h file
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
             


;;markdown mode
;;see https://jblevins.org/projects/markdown-mode/

;;gap mode
;;run package-list-packages, find gap-mode, type i (for install) and then x (to execute). It will download the latest version and install it automatically. Running package-list-packages in the future will allow you to easily updage gap-mode.
;;https://bitbucket.org/gvol/gap-mode/src
(setq gap-executable "/usr/bin/gap-4.11")
(setq gap-start-options (list "-E"))
;;(setq gap-start-options (list "-l" "/usr/algebra/gap3.1/lib"
;;                              "-m" "2m"))

;;use python mode to get color for .qc files
(setq auto-mode-alist
      (cons '("\\.qc$" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.txt$" . org-mode) auto-mode-alist))
;;(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))
;;(add-hook 'org-mode-hook 'turn-on-auto-fill)
;;(add-hook 'org-mode-hook 'turn-on-visual-line-mode)

;;matlab mode


;;(add-to-list 'load-path "~/path/to/matlab_el")
;;(require 'matlab-load)


;; download el file and use it in cherenkov
;;(add-to-list 'load-path "~/weilei_library/matlab-emacs")
;;(require 'matlab-load)
;;(add-hook 'matlab-mode-hook 'turn-off-auto-fill)

;;use 
;;(setq auto-mode-alist
;;      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;;(add-hook 'octave-mode-hook
 ;;         (lambda ()
  ;;          (abbrev-mode 1)
   ;;         (auto-fill-mode 1)
     ;;       (if (eq window-system 'x)
       ;;         (font-lock-mode 1))))




;;the following use octave model for .m files. not in use anymore
;;it has been replaced by the matlab mode since Jan 2019
;;(setq auto-mode-alist
;;            (cons '("\\.m$" . octave-mode) auto-mode-alist))

;;(add-hook 'octave-mode-hook
;;	  (lambda ()
;;	    (abbrev-mode 1)
;;	    (if (eq window-system 'x)
;;		                (font-lock-mode 1))))


;; org-mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-startup-truncated nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )





;; for weilei mac

;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)


;; (add-hook 'text-mode-hook 'turn-on-auto-fill)

;;(setq auto-mode-alist
;;      (cons '("\\.txt$" . org-mode) auto-mode-alist))

;; (add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)


;;weilei add kivy mode
;;(add-to-list 'load-path "~/.emacs.d/weilei/")


(require 'kivy-mode)
    (add-to-list 'auto-mode-alist '("\\.kv$" . kivy-mode))

(add-hook 'kivy-mode-hook
     '(lambda ()
        (electric-indent-local-mode t)))




;;Weilei Jan 9 2018
;;View pdf file in tex mode. both adobee and TeXShop prevent updating to the pdf file.
;;after turn on automatic update for external editor in TexShop preview, it works. Jan 25 2019
;;default cmd
;;     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
;;use Preview.app (only Preview.app can show the update
;;     ("View" "open -a Preview.app %s.pdf" TeX-run-discard-or-function t t :help "Run Viewer")
;;use TexShop
;;     ("View" "open -a TexShop.app %s.pdf" TeX-run-discard-or-function t t :help "Run Viewer")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "open -a TeXShop.app %s.pdf" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t t :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(package-selected-packages (quote (auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
