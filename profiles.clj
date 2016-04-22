{:user
 {:dependencies [
    [pjstadig/humane-test-output "0.8.0"]
    [org.clojure/tools.namespace "0.2.11"]
  ]
  :injections [(require 'pjstadig.humane-test-output)
               (pjstadig.humane-test-output/activate!)]
  :plugins [[lein-difftest "2.0.0"]
            [lein-cljfmt "0.5.2"]]
  :signing {:gpg-key "CE27F99B"}}
 :repl {:plugins [[cider/cider-nrepl "0.10.0-SNAPSHOT"]
                  [refactor-nrepl "2.0.0-SNAPSHOT"]]
        :dependencies [[alembic "0.3.2"]
                       [org.clojure/tools.nrepl "0.2.12"]]}}
