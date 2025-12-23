#!/bin/sh

exec redis-server --protected-mode no --bind 0.0.0.0 --maxmemory 256mb --maxmemory-policy allkeys-lru