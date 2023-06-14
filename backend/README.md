# Backend

## Development

### Building Dockerimage

```
docker buildx build --tag gcr.io/capstone-project-c23-ps176   --file Dockerfile .
```

### Running Dockerimage

```
docker run -p 5000:5000 gcr.io/capstone-project-c23-ps176  
```

### Accessing Endpoint

```
curl -H "Content-Type: application/json" -X POST localhost:5000/predict
```

## Deploying to CloudRun

```
gcloud run services replace service.yaml
```
