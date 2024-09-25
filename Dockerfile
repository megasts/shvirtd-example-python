FROM python:3.9-slim
WORKDIR /app
#ENV PATH="/app/bin:$PATH"
#Установка компилятора gcc
RUN apt-get update && \
#    apt-get install -y --no-install-recommends gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt /var/lib/dpkg /tmp/* /var/tmp/*
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends gcc
#RUN python -m venv /app/venv


# RUN python -m venv /app/venv
ENV PATH="/app/bin:$PATH"
COPY requirements.txt ./
# Монтирование кеша pip с docker host
#RUN --mount=type=cache,target=~/.cache/pip pip install -r requirements.txt
RUN pip install -r requirements.txt


# FROM python:3.9-slim AS worker

# ENV USER=python
# ENV GROUP=python
# ENV PATH="/app/venv/bin:$PATH"

# WORKDIR /app

# COPY --from=builder --chown=$USER:$GROUP /app/venv ./venv
# COPY . .

# RUN groupadd -g 1001 $GROUP && \
#     useradd -r -m -u 1001 -g $GROUP $USER && \
#     chown -R $USER:$GROUP /app

#USER $USER

# RUN addgroup --system python && \
#     adduser --system --disabled-password  --ingroup python python && chown python:python /app
# USER python

# COPY --chown=python:python --from=builder /app/venv ./venv
# COPY --chown=python:python . .

# ENV PATH="/app/venv/bin:$PATH"
COPY main.py ./
CMD ["python", "main.py"]