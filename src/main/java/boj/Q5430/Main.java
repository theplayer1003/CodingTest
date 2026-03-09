package boj.Q5430;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int T = Integer.parseInt(br.readLine());

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < T; i++) {
            String commands = br.readLine();

            int aryLength = Integer.parseInt(br.readLine());

            String numberString = br.readLine();
            numberString = numberString.replace("[", "");
            numberString = numberString.replace("]", "");
            String[] split = numberString.split(",");

            int[] ary = new int[aryLength];
            for (int j = 0; j < aryLength; j++) {
                ary[j] = Integer.parseInt(split[j]);
            }

            int head = 0;
            int tail = aryLength - 1;
            boolean reverseFlag = false;
            for (char command : commands.toCharArray()) {
                if (command == 'R') {
                    int temp = tail;
                    tail = head;
                    head = temp;
                    reverseFlag = true;
                } else {
                    if (!reverseFlag) {
                        if (head > tail) {
                            sb.append("error").append("\n");
                            break;
                        }
                        head++;
                    } else {
                        if (tail > head) {
                            sb.append("error").append("\n");
                            break;
                        }
                        tail++;
                    }
                }
            }

            sb.append("[");
            if (!reverseFlag) {
                while (head <= tail) {
                    sb.append(ary[head]).append(",");
                    head++;
                }
                if (sb.charAt(sb.length() - 1) == ',') {
                    sb.deleteCharAt(sb.length() - 1).append("]").append("\n");
                }
            } else {
                while (tail <= head) {
                    sb.append(ary[tail]).append(",");
                    tail++;
                }
                if (sb.charAt(sb.length() - 1) == ',') {
                    sb.deleteCharAt(sb.length() - 1).append("]").append("\n");
                }
            }


        }

        System.out.println(sb);
    }
}
