ARG image_full_name

FROM ${image_full_name}

RUN mkdir -p /app

COPY src/{{MODULE}}/* /app

EXPOSE 8000

#CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
CMD [ "python3", "/app/{{MODULE}}.py" ]
