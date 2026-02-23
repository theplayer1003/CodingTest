package boj.Q17298;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        Deque<Integer> mStack = new ArrayDeque<>();
        StringBuilder sb = new StringBuilder();
        List<Integer> ans = new ArrayList<>();

        int N = Integer.parseInt(st.nextToken());

        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < N; i++) {
            int now = Integer.parseInt(st.nextToken());

            while (!mStack.isEmpty() && mStack.peekLast() < now) {
                //sb.append(now + " ");
                ans.add(now);
                mStack.pollLast();
            }

            mStack.offerLast(now);
        }

//        sb.append(-1);
//        mStack.pollLast();
//
//        while (!mStack.isEmpty()) {
//            sb.insert(0, "-1 ");
//            mStack.pollLast();
//        }
        // Integer last = ans.getLast(); java 21, 백준 컴파일 에러
        Integer last = ans.get(ans.size() - 1);
        while(!mStack.isEmpty()) {
            if (last >= mStack.peekLast()) {
                ans.add(-1);
                mStack.pollLast();
            } else {
                ans.add(0, -1);
                mStack.pollLast();
            }
        }

        for (Integer an : ans) {
            sb.append(an + " ");
        }

        System.out.println(sb);
    }
}
/*
그러니까 결국 오큰수는
나 이후에 들어온 수 중에 제일 먼저 들어온 큰수를 찾아내자는 것

3, 2, 5, 10, 2, 1, 0, 12

12
15 15 15 2 7 1 10 11 12 10 9 8

-1 -1 -1 7 10 10 11 12 -1 -1 -1 -1
 */
