package com.jk.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
@EnableAutoConfiguration
public class RedisTest {

    @Autowired
    private RedisTemplate redisTemplate;

    public static void main(String[] args) {
        RedisTest rs = new RedisTest();
        rs.redisset();
    }

    public void redisset(){
        ValueOperations opsForValue = redisTemplate.opsForValue();
        //redisTemplate的set方法  redisTemplate.opsForValue().set()
        opsForValue.set("123","123");
        //设置失效时间 的方法  redisTemplate.expire（Key ，时间，时间的单位）
        //redisTemplate.expire(user.getUserphone(), 60, TimeUnit.SECONDS);
    }
}
