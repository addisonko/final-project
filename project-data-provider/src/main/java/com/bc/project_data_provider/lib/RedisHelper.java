package com.bc.project_data_provider.lib;

import java.time.Duration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import tools.jackson.databind.ObjectMapper;

public class RedisHelper {
  private RedisTemplate<String, String> redisTemplate;
  private ObjectMapper objectMapper;

  public RedisHelper(RedisConnectionFactory factory, ObjectMapper objectMapper) {
    RedisTemplate<String, String> redisTemplate = new RedisTemplate<>();
    redisTemplate.setConnectionFactory(factory);
    redisTemplate.setKeySerializer(RedisSerializer.string());
    redisTemplate.setValueSerializer(RedisSerializer.string()); 
    redisTemplate.afterPropertiesSet();
    this.redisTemplate = redisTemplate; 
    this.objectMapper = objectMapper;
  }

  public <T> T get (String key, Class<T> valueType) {
    String json = this.redisTemplate.opsForValue().get(key);
    if (json == null || json.isBlank()) {
      return null;
    }
    return this.objectMapper.readValue(json, valueType);
  }

  public void set(String key, Object object, Duration duration) {
    String json = this.objectMapper.writeValueAsString(object);
    this.redisTemplate.opsForValue().set(key, json, duration);
  }
}
