# Backend

## Development

### Building Dockerimage

```
docker buildx build --tag <tag> --file Dockerfile .
```

### Running Dockerimage

```
docker run -p 5000:5000 <tag>  
```

### Accessing Endpoint

```
# coordinate latitude and longitude [1.0, 2.0]
curl -d '{"coordinate": [1.0, 2.0]}' -H "Content-Type: application/json" -X POST localhost:5000/predict
```

## Deploying to CloudRun

```
gcloud run services replace service.yaml
```