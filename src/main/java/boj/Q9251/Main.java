package boj.Q9251;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        final Scanner scanner = new Scanner(System.in);
        final String s1 = scanner.nextLine();
        final String s2 = scanner.nextLine();

        int[][] memo = new int[s1.length() + 1][s2.length() + 1];
        int index1 = 1;

        for (char c1 : s1.toCharArray()) {
            int index2 = 1;
            for (char c2 : s2.toCharArray()) {
                if (c1 == c2) {
                    memo[index1][index2] = memo[index1 - 1][index2 - 1] + 1;
                } else {
                    memo[index1][index2] = Math.max(memo[index1-1][index2], memo[index1][index2-1]);
                }
                index2++;
            }

            index1++;
        }

        System.out.println(memo[s1.length()][s2.length()]);
    }
}
/*
메모이제이션, 점화식.
ACAYKP, CAPCAK
문자열을 하나씩 맞춰볼건데 이전에 맞춰놓은 길이를 기록해놓고 이용하자.
A -> C, A : 수열 시작, 1 기록해둠 -> A와의 공통 수열 최장 길이는 1임을 확인
C -> C : 수열 시작, 1 기록해둠
A -> C : 앞선 라인에 C를 발견해서 일단 최장 길이 1임을 기록해놨음. -> A : 겹치는 부분 발견, 이제 최장 길이 2를 보장함 ACA -> CA 가 겹침을 확인
Y
K
P
 */