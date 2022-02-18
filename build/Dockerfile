FROM continuumio/anaconda3
LABEL author="Darren Leniston"
LABEL author_contact="dleniston@waltoninstitute.ie"

WORKDIR /home/data/

RUN conda install -c conda-forge -y dtale
RUN conda install -c conda-forge -y voila
RUN conda install -c conda-forge -y featuretools
RUN pip install graphviz
RUN pip install pydot
RUN conda install -c conda-forge -y phik
RUN conda install -c conda-forge -y pingouin

EXPOSE 8888
