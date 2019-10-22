;; 添加org导出md功能
(with-eval-after-load 'org
  (add-to-list 'org-export-backends 'md))


;; 提供init-org的feature
(provide 'init-org)
