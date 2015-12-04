FROM java:8

# install git
RUN apt-get update && apt-get install -y git

# setup buildtime arguments and runtime variables
ARG USERNAME
ARG TESTNAME
ARG TIMESTAMP
ENV USERNAME $USERNAME
ENV TESTNAME $TESTNAME
ENV TIMESTAMP $TIMESTAMP

# copy user's repo
RUN git clone https://github.com/${USERNAME}/kill-the-mutants
WORKDIR /kill-the-mutants

# setup for a given test suite
RUN mv ${TESTNAME}/${TIMESTAMP}/* ${TESTNAME}/

# compile
ENV DEPENDENCIES_DIR dependencies
ENV CLASSPATH ${DEPENDENCIES_DIR}/*
RUN javac -cp "${CLASSPATH}" ${TESTNAME}/*.java
ENV CLASSPATH=${CLASSPATH}:.

# make run.sh executable
RUN chmod +x run.sh

# run mutation testing
CMD ./run.sh
