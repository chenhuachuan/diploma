package com.jz1501.chenhc.diploma.tfbook.util;

import java.io.FileWriter;
import java.io.IOException;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.util
 * @description:支付宝
 * @author:chenhc
 * @create_time:2019-04-15
 * @version:v1.0.0
 **/
public class AlipayConfig {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016093000633222";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCBlXt8O+6GyNwIaHXwzT2u9vXUI4e7meM+dGrRyqakJwOlxsrwpfAO2lgoZpG+lDjfDP+q6XcWIDHVMo7ptOSHvBg6oMn9yO7EFgR9wnPaSacAW4nQWtHBN4MByw5Drnd1RGeTJOTxXznGDE7bfsM1fLEUu5bk5cViYb2tGUnzjkfSqGCDw789ketlKSU8/+mR5PKF8EOslCaNdP7fwV/ju4v+54EQhXT+Dl76qmFIYJkHgd4y0VtzjAvyzy+9Z44Y0gVzMl9bi6UajqvlJgla6Bva6d8YMgDkqvxe3bJ0XXF6eoWJni1gQfhfE3ke8Pnyd88FdPvDbd5WaHP6g7MvAgMBAAECggEAP2GVB5vsvCJMdRRa84//pq+GZ9+FCT5oxuh8QubDATFP+Gq2YmRXeXxUeFZK3RN0iay69KbCp6DRnvzep/LhgH6Av1Rb1/TKzEAUrEpLDi7OLz+WtcFmLQJw4pSmAna4WTQ/ENqP3Ht+L59fhr6GzoeRuZlTYdv84nT6KEthP23a+G71DGDWE1v2r+j2piCmKh5wisVn3qWKubOioSOh52Kg9vA+PluUFO3hXkIRwmeVA7A/giAgoP+blEo7gh7qsDaw3y7fOyEzjeQ8aEOsOXOt3Vhg21nqRTZgiZ3qKusVNIYObKao/hAnkabkzJuixuuE7RzswC1UJzWP+/VQcQKBgQC7JFojm/AwNob7vlnWPluwbWKwxCsVqSc6Ib8X4uVqO568V8u0Oos/E6wwtMN5MAT8uyzIZ2Grpwt3fANLB4EA+HnhPQkm+5yvikmy1+vkKfEt1PlW4Hcsrm+zdn+6gjJaRFHvXo9NkXzbxnHT9jCsz3wrawh9n8QJZitzr6s82QKBgQCxQ4F5V8+T8gvm8IisatpmVrrLXeDa5E7DrkoLhtgN0KWIidhg6Zvr0JqoRTANgc5OWZhwlm8tdDArZb9M9/GU86yOQRqwm6rUswT14pZ4fr5gXtdBAZnE0DOm4+QhtSCSXvt27aCDyLkinpHL+fjbZlIjvvRGxQiN6YYrelyLRwKBgCKxEXiqbrMxWIKQfezmcG7bSEFGjEoeqmPvX5JZAHhaBwoZKG0HsUqHJhN9XwM3MKV9OUcJSyTb+ZczyRR+lp6McWOcwfaVDC3Kb/EUb+lDES+S3IoLYGxLBe/51qHHgvgS1DGQkPYrMz82oWFOsSVH7VfLJq7LEDdB1mpCtXa5AoGAQfj0y/txZwdzhIzK4RiXlfT7akrTL8Q+yDcqmaWi7WlU4j8jR9ZJ0Hb/yFaPrsc7yA8yW9yxHgKbFtu0WeoBgEU8WGlEjKwy5RyHYRfmlovdQLKrfCcjWot+XcN9GUp3B+LPxhBkaAehV5AahQbQpp8rPOCJu3kDWQWriKzummsCgYBlRJRD1dTA1nxH75ngt6CPR5KSXqvcOz7UplvrGDDnGiLFWK416IR4K6ye5YXKk8i7L2cBWHvaK4/66GZmZZ9rxjNkHc1WCrZvkpiTTaOKimWsNOgRPVNTd+my53rA2cetidoXdAeTlfKj7Z1OsyhTwZW35JZvCC/6paaCKax57A==";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
    // 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk6XDRCieH9qb8yPO/s/E9kZSQSwsJeeORSg5dOZ/XqTQKAfagL1gqz1vrBCrUEfgg5GP9s7uZw/oNWJXN6AKPmUqc+QyVUJaspYgwaA+w/DAUy3qQl2aC1ha3hDzp0uxJU71neXO7hQ4/mA0xAdrXsDzRe/WNAuJ6DHzlF87pY5UJ/LgBvSpe3PqaGKoaZl1mliUBchL09fQd1yXLQR/TQ1aFohuFM2ExKZWkcNgbrvq2zyrZC2OtiLHKkXuF7Mh9Rc7Y6LD4+BvFY5CWwGe0pQIqzgSpkMqIlxkGbqNLB2XV/fjf6ED3pkzJ5C2HjIsXgezJ4ZRWGRFSvG6J60bwwIDAQAB";
    // 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    /**
     * 返回的时候此页面不会返回到用户页面，只会执行你写到控制器里的地址
     */
    public static String notify_url = "http://127.0.0.1:8679/tfbook/pay/notify_url.jsp";
    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    /**
     * 此页面是同步返回用户页面，也就是用户支付后看到的页面，上面的notify_url是异步返回商家操作，谢谢
     * 要是看不懂就找度娘，或者多读几遍，或者去看支付宝第三方接口API，不看API直接拿去就用，遇坑不怪别人
     */
    //public static String return_url = "http://127.0.0.1:8679/tfbook/pay/return_url.jsp";
    public static String return_url = "http://localhost:8679/tfbook/pages/success.jsp";
    // 签名方式
    public static String sign_type = "RSA2";
    // 字符编码格式
    public static String charset = "utf-8";
    // 支付宝网关  : 真实版：https://openapi.alipay.com/gateway.do
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 日志地址
    public static String log_path = "E:/QQfile/DiplomaProject/logs/";
    // ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     *
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_"
                    + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
