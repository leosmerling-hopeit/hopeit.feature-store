SRC = $(wildcard src/*.py)

.PHONY: dev check test install clean schemas dist-only

deps:
	cd engine && \
	pip install -U pip && \
	pip install -U wheel && \
	pip install -U -r apps/features-store/requirements.txt && \
	pip install -U -r apps/ops/requirements.txt

dev:
	cd apps/feature-store && \
	export HOPEIT_FEATURE_STORE_APP_VERSION=0.1 && \
	export HOPEIT_ENGINE_VERSION=0.16.5 && \
	pip install -e .

start-app:
	HOPEIT_FEATURE_STORE_APP_VERSION=0.1 \
	HOPEIT_FEATURE_STORE_DATA_PATH=./_data \
	HOPEIT_FEATURE_STORE_WORK_DIR=./_work \
	hopeit_server run --port=8020 --config-files=ops/server/server-config-local.json,ops/config-manager/plugin-config.json,apps/feature-store/config/feature-store.json

start-ops:
	HOPEIT_FEATURE_STORE_APP_VERSION=0.1 \
	HOPEIT_FEATURE_STORE_DATA_PATH=./_data \
	HOPEIT_FEATURE_STORE_WORK_DIR=./_work \
	HOPEIT_APPS_VISUALIZER_HOSTS=http://localhost:8020 \
	hopeit_server run --port=8040 --config-files=ops/server/server-config-local.json,ops/config-manager/plugin-config.json,ops/apps-visualizer/plugin-config.json
