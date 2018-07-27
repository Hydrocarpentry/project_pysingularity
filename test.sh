#!/bin/bash
python /tmp/prepare_flood_events_table.py STORM_data_flooded_streets_2010-2016.csv flood_events.csv
wget -O hampt_rd_data.sqlite https://osf.io/mr7jx/?action=download
python /tmp/make_dly_obs_table_standalone.py hampt_rd_data.sqlite
python /tmp/by_event_for_model.py flood_events.csv for_model_avgs.csv
Rscript /tmp/model_flood_counts_rf_ps_cln.r --input for_model_avgs.csv
python /tmp/plot_count_model_results.py poisson_out_train.csv poisson_out_test.csv out
