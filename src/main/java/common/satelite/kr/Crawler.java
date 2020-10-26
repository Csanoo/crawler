package main.java.common.satelite.kr;

// Crawler.java
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.Connection;

public class Crawler {
    public static void main(String args[]){
        try {
            // 1. 수집 대상 URL
            String URL = "https://www.youtube.com/results?search_query=성시경";

            // 2. Connection 생성
            Connection conn = Jsoup.connect(URL);

            // 3. HTML 파싱.
            Document html = conn.get(); // conn.post();

            // 4. HTML 출력
            System.out.println( html.toString() );

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}