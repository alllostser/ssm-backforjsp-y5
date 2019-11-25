package com.neuedu.common;

import org.springframework.stereotype.Component;

@Component
public class ResponseCode<T> {
    private Integer status;//状态吗
    private T data;//数据
    private String mag; //失败或成功返回的信息

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMag() {
        return mag;
    }

    public void setMag(String mag) {
        this.mag = mag;
    }

    //成功的时候只要返回状态码和成功获取数据
    public static <T>ResponseCode successRs(T data){
        ResponseCode rs = new ResponseCode();
        rs.setStatus(0);
        rs.setData(data);
        return rs;
    }
    public static <T>ResponseCode successRs(T data,String mag){
        ResponseCode rs = new ResponseCode();
        rs.setStatus(0);
        rs.setData(data);
        rs.setMag(mag);
        return rs;
    }
    //失败的时候返回状态码和失败的信息
    public static <T>ResponseCode  defeatedRs(T data,String mag){
        ResponseCode rs = new ResponseCode();
        rs.setStatus(1);
        rs.setData(data);
        rs.setMag(mag);
        return rs;
    }
    public static ResponseCode  defeatedRs(String mag){
        ResponseCode rs = new ResponseCode();
        rs.setStatus(1);
        rs.setMag(mag);
        return rs;
    }
    @Override
    public String toString() {
        return "ResponseCode{" +
                "status=" + status +
                ", data=" + data +
                ", mag='" + mag + '\'' +
                '}';
    }
}