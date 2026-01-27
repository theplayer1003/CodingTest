package boj.Q1159;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws IOException {
        final BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        final int N = Integer.parseInt(br.readLine());
        final int[] alphabet = new int[26];

        for (int i = 0; i < N; i++) {
            alphabet[br.readLine().charAt(0) - 'a']++;
        }

        final StringBuilder sb = new StringBuilder();

        for (int i = 0; i < 26; i++) {
            if (alphabet[i] >= 5) {
                sb.append((char) (i + 'a'));
            }
        }

        if (sb.isEmpty()) {
            System.out.println("PREDAJA");
        } else {
            System.out.println(sb);
        }
    }
}
