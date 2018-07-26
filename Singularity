# Singularity
Bootstrap: docker
From: ubuntu:18.04
%post
    apt-get update && apt-get install -y python-pandas r-base
    echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
    R --slave -e "install.packages('caret')"
    R --slave -e "install.packages('randomForest')"
%files
    prepare_flood_events_table.py /tmp
    make_dly_obs_table_standalone.py /tmp
    by_event_for_model.py /tmp
    model_flood_counts_rf_ps_cln.r /tmp
    plot_count_model_results.py /tmp
    test.sh /tmp
%runscript
    bash /tmp/test.sh
