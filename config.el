;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


;; This is for forge to get the github token since their wizard seems to tbe broken
(setq auth-sources '("~/.authinfo"))

;; Bootstrap org mode publish
;; Move items to the trash
(setq delete-by-moving-to-trash t)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; clients, file templates and snippets.
(setq user-full-name "Joe Bellus"
    user-mail-address "joe@5sigma.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

(require 'yasnippet)
(yas-global-mode 1)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Nextcloud/org")

(org-clock-persistence-insinuate)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Change tasks to whatever when clocking in
(setq org-clock-in-switch-to-state "STRT")
;; Change states
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)
;; use pretty things for the clocktable
(setq org-pretty-entities t)
;; If idle for more than 15 minutes, resolve the things by asking what to do
;; with the clock time
(setq org-clock-idle-time 15)

(customize-set-variable 'org-journal-dir "~/Nextcloud/org/entries")
(customize-set-variable 'org-journal-date-format "%A, %d %B %Y")
(require 'org-journal)



(setq org-publish-project-alist
    '(("org-notes"
        :base-directory "~/Nextcloud/org/"
        :publishing-directory "~/public_html/"
        :publishing-function org-twbs-publish-to-html
        :with-sub-superscript nil
        )))

(setq jiralib-url "https://quikserve.atlassian.net")
(defconst jiralib-token
'("Cookie" . "cloud.session.token=eyJraWQiOiJzZXNzaW9uLXNlcnZpY2VcL3Nlc3Npb24tc2VydmljZSIsImFsZyI6IlJTMjU2In0.eyJhc3NvY2lhdGlvbnMiOltdLCJzdWIiOiI1NTcwNTg6NDAxMzFmM2QtZmEzMC00ZTYwLWIzYjQtNDMwNmZmZTU1NjFlIiwiZW1haWxEb21haW4iOiJxdWlrc2VydmUuY29tIiwiaW1wZXJzb25hdGlvbiI6W10sImNyZWF0ZWQiOjE1ODc5NDg1MjQsInJlZnJlc2hUaW1lb3V0IjoxNTg3OTQ5NzM0LCJ2ZXJpZmllZCI6dHJ1ZSwiaXNzIjoic2Vzc2lvbi1zZXJ2aWNlIiwic2Vzc2lvbklkIjoiNzI5Nzg3NjEtNjM2ZC00MzE1LWJlODYtODkwNGZiZDQ2MjgzIiwiYXVkIjoiYXRsYXNzaWFuIiwibmJmIjoxNTg3OTQ5MTM0LCJleHAiOjE1OTA1NDExMzQsImlhdCI6MTU4Nzk0OTEzNCwiZW1haWwiOiJqb2VAcXVpa3NlcnZlLmNvbSIsImp0aSI6IjcyOTc4NzYxLTYzNmQtNDMxNS1iZTg2LTg5MDRmYmQ0NjI4MyJ9.GjglclzUd9zd2WEltVwEcJ6mKXLa8Td94_KPNgrjbxbtqmZ5EoO3hRubiw_quMHRBikcx10VjQIrrRe-MtkIeFpr56QaUp3WheBRlPjuKakTt0YhIeOg8EU9_HwgEQdBPBHXC5bILwp5UCYQ-0Q4S1QEE2HiloF_tHEcNbnK-aTBNmiVcv0pznPx85FPhvNifvnP9NHgkMfjL_0XkYcvXUXIphJ0X8CIkKxnqE-2k8ootaTURnJVy04rj4FEYgOnvqCTi6-Jyl0rRccLnakIaCE9uKWsCnlfn7ywvptO2K0lZ_ELPmOOkSP-t9rCzniRJzj4_xn6RQ5bR5_umd3YpQ"))

(add-hook 'elixir-mode-hook
        (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))


(add-to-list 'auto-mode-alist '("\\.leex\\'" . web-mode))

(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)