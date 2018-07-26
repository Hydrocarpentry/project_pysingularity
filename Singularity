# Singularity
Bootstrap: docker
From: ubuntu:18.04
%post
    apt-get update && apt-get install -y python-pandas r-base
	apt-get install wget
	wget -O /hampt_rd_data.sqlite https://osf.io/mr7jx/?action=download 
	wget -O /STORM_data_flooded_streets_2010-2016.csv https://github.com/Hydrocarpentry/reproduced_data/blob/master/STORM_data_flooded_streets_2010-2016.csv
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
