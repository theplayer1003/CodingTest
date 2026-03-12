package boj.Q11003;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.PriorityQueue;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        // 모노 디큐
    }

    private static void useJavaCollection() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        StringBuilder sb = new StringBuilder();

        Deque<Integer> que = new ArrayDeque<>();
        PriorityQueue<Integer> pq = new PriorityQueue<>();

        int N = Integer.parseInt(st.nextToken());
        int L = Integer.parseInt(st.nextToken());

        st = new StringTokenizer(br.readLine());

        for (int i = 0; i < L; i++) {
            int current = Integer.parseInt(st.nextToken());
            que.offerLast(current);
            pq.offer(current);

            sb.append(pq.peek() + " ");
        }
        pq.remove(que.pollFirst());

        for (int i = 0; i < N - L; i++) {
            int current = Integer.parseInt(st.nextToken());
            que.offerLast(current);
            pq.offer(current);

            if (pq.size() == L) {
                sb.append(pq.peek() + " ");
                pq.remove(que.pollFirst());
            }
        }

        System.out.println(sb);
    }
}
/*
500만 번의 컬렉션 제어. 오토박싱에 의한 Integer 객체 생성으로 GC 부하 발생

PQ 의 remove 메서드.
힙 트리는 좌우 대소가 엄격한 이진 탐색 트리와 다르게 부모가 자식보다 작다는 부분 정렬만 담는다.
remove(Object o) 호출로 인해 PQ 는 해당 객체가 (PQ 내부)배열 어디에 있는지 찾기 위해
처음부터 끝가지 탐색해야한다.
값을 찾는데 O(L), 지우고 트리 재정렬에 O(log L) -> O(L)
이를 N번 반복해서 O(N * L). 최악 N = 5,000,000 L = 5,000,000
 */
