###  NYC Taxi Analytics Pipeline
Pipeline analytique complet – Data Engineering (SQL)

##  1. Objectif du projet
Ce projet consiste à construire un pipeline analytique complet autour des données Yellow Taxi NYC.
Il couvre toutes les étapes essentielles du métier de data engineer :

* ingestion et staging

* nettoyage et tests de qualité

* transformations analytiques

* création de vues matérialisées

* documentation et structuration d’un projet SQL professionnel

Ce projet fait partie d’un portfolio visant à démontrer des compétences en SQL avancé, data quality, modélisation analytique et structuration de pipeline.

## 2. Architecture du pipeline

diagram d'architecture dans diagram/

## 3. Nettoyage & Quality Checks

Des tests de qualité ont été appliqués pour garantir l’intégrité des données :

trip_distance >= 0

fare_amount >= 0

pickup_datetime < dropoff_datetime

passenger_count <= 6

Les lignes ne respectant pas ces règles ont été isolées pour analyse.

📄 Rapport complet : quality/report.md  
📁 Tests SQL : quality/tests.sql

## 4. Requêtes analytiques avancées

* Rolling Average – 7 jours
Calcul d’une moyenne glissante du revenu moyen par jour.

* Top 10 busiest pickup zones
Identification des zones les plus actives via les PULocationID.

* Revenue per borough
Agrégation du revenu total par borough (Manhattan, Brooklyn, etc.).

* Détection d’anomalies
Repérage des courses suspectes :

distance > 100

fare_amount < 0

* Toutes les requêtes sont disponibles dans : analytics/

## 5. Vue matérialisée : mv_daily_stats
Une vue matérialisée a été créée pour regrouper les statistiques journalières essentielles :

date

total trips

total revenue

average fare

rolling average 7 jours

distance moyenne

Cette vue sert de base à des dashboards ou analyses rapides.

 SQL : models/mv_daily_stats.sql

## 6. Structure du repository
Code
nyc-taxi-analytics-pipeline/
│
├── README.md
│
├── diagrams/
│   └── pipeline_architecture.png
│
├── quality/
│   ├── report.md
│   └── tests.sql
│
├── analytics/
│   ├── rolling_avg_7_days.sql
│   ├── busiest_pickup_zones.sql
│   ├── revenue_per_borough.sql
│   └── anomalies.sql
│
├── models/
│   ├── mv_daily_stats.sql
│   ├── dim_location.sql
│   └── fact_trips_cleaned.sql
│
├── staging/
│   └── staging_trips.sql
│
└── notes/
    └── decisions.md
## 7. Compétences démontrées
SQL avancé (fenêtres, agrégations, CTE, jointures)

* Data Quality & validation

* Modélisation analytique

* Création de vues matérialisées

* Structuration d’un projet data

* Documentation claire et professionnelle

## 8. Améliorations possibles
* Ce projet peut être enrichi avec :

* un DAG Airflow pour orchestrer le pipeline

* un modèle dbt pour la transformation

* un dashboard (Metabase, Power BI, Looker Studio)

* un stockage cloud (GCP/AWS/Azure)

* des tests automatisés (Great Expectations)
