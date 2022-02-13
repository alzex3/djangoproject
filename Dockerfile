FROM python:3.10
RUN mkdir -p /home/server/code
WORKDIR /home/server/code

ENV PYTHONUNBUFFERED=1
ENV VIRTUAL_ENV=/home/server/code/.venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY . /home/server/code
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
