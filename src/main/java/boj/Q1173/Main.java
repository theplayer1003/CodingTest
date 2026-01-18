package boj.Q1173;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        final Scanner s = new Scanner(System.in);

        int targetExerciseTime = s.nextInt();
        int minPulse = s.nextInt();
        int maxPulse = s.nextInt();
        int pulseIncrease = s.nextInt();
        int pulseDecrease = s.nextInt();

        int currentpulse = minPulse;
        int lapse = 0;
        int totalTime = 0;

        if (minPulse + pulseIncrease > maxPulse) {
            System.out.println(-1);
            return;
        }

        while (lapse < targetExerciseTime) {
            if (currentpulse + pulseIncrease <= maxPulse) {
                currentpulse += pulseIncrease;
                lapse++;
            } else {
                currentpulse -= pulseDecrease;
                if (currentpulse < minPulse) {
                    currentpulse = minPulse;
                }
            }

            totalTime++;
        }

        System.out.println(totalTime);
    }
}
/*
운동 or 휴식, 단위는 1분

운동 -> 맥박 T 상승, X + T
맥박이 M을 넘지 않아야 운동이 가능

휴식 -> 맥박 R 감소, X - R
맥박이 m보다 낮아지면 안됨

m이 스타트. 운동을 N 분 하려고 할때 필요한 시간의 최소값.

N, m, M, T, R 주어지면 N 분 운동하는데 필요한 시간의 최소값 출력

 */