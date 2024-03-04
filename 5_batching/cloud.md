trips_data_all.reports-2020


gcloud dataproc jobs submit pyspark \
    --cluster=de-zoomcamp-cluster \
    --region=us-central1 \
    --jars=gs://spark-lib/bigquery/spark-bigquery-latest_2.12.jar \
    gs://mage-zoompamp-matvei-roshchin/code/06_spark_sql_big_query.py \
    -- \
        --input_green=gs://mage-zoompamp-matvei-roshchin/pq/green/2020/*/ \
        --input_yellow=gs://mage-zoompamp-matvei-roshchin/pq/yellow/2020/*/ \
        --output=trips_data_all.reports-2020


cd desktop/zoomcamp/data_eng_zoomcamp_2024_Matvei_R/5_batching

gsutil cp 06_spark_sql_big_query.py gs://mage-zoompamp-matvei-roshchin/code/06_spark_sql_big_query.py