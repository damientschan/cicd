FROM python:3.9

RUN useradd -ms /bin/bash newuser
USER newuser
WORKDIR /home/newuser/code

WORKDIR /home/newuser/code

COPY ./setup.py /home/newuser/code/setup.py

COPY ./requirements.txt /home/newuser/code/requirements.txt

COPY ./README.md /home/newuser/code/README.md

COPY ./src /home/newuser/code/src

RUN pip install /home/newuser/code

COPY ./controller /home/newuser/code/controller

CMD ["uvicorn", "controller.controller:app", "--host", "0.0.0.0", "--port", "80"]
