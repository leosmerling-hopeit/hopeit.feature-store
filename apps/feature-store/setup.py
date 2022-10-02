import setuptools
import os

setuptools.setup(
    name="hopeit.feature_store",
    version=os.getenv("HOPEIT_FEATURE_STORE_APP_VERSION"),
    description="Hopeit Feature Store App",
    package_dir={
        "": "src"
    },
    packages=[
        "hopeit.feature_store"
    ],
    include_package_data=True,
    python_requires=">=3.7",
    install_requires=[
        f"hopeit.engine[web,cli,redis-streams,fs-storage,config-manager]=={os.getenv('HOPEIT_ENGINE_VERSION')}",
        f"hopeit.fs-storage=={os.getenv('HOPEIT_ENGINE_VERSION')}",
    ],
    extras_require={
    },
    entry_points={
    }
)
