(package! org-ql)

(when IS-MAC
  (package! org-mac-link :recipe
    (:host gitlab
     :repo "albertsj1/org-mac-link")))

(package! deadgrep)
