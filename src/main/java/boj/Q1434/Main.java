package boj.Q1434;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        final BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        final int boxNumber = Integer.parseInt(st.nextToken());
        final int bookNumber = Integer.parseInt(st.nextToken());

        final int[] boxes = new int[boxNumber];
        final int[] books = new int[bookNumber];

        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < boxNumber; i++) {
            boxes[i] = Integer.parseInt(st.nextToken());
        }
        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < bookNumber; i++) {
            books[i] = Integer.parseInt(st.nextToken());
        }

//        int result = 0;
//
//        for (int i = 0; i < boxNumber; i++) {
//            for (int j = 0; j < bookNumber; j++) {
//                if (books[j] == 0) {
//                    continue;
//                }
//
//                if (boxes[i] >= books[j]) {
//                    boxes[i] -= books[j];
//                    books[j] = 0;
//                } else {
//                    break;
//                }
//            }
//        }
//
//        for (int capacity : boxes) {
//            result += capacity;
//        }
//
//        System.out.println(result);

        int totalCapacity = 0;
        for (int box : boxes) {
            totalCapacity += box;
        }

        int totalBookSize = 0;
        for (int book : books) {
            totalBookSize += book;
        }

        System.out.println(totalCapacity - totalBookSize);
    }
}
/*
1, 2, 3, 4, 5, 6, 7, ..., N

1: 현재 책을 현재 박스에 넣으려고 시도한다
1-1: 들어간다면 책을 넣고 다음 책을 꺼내들고 1번 행동으로 돌아간다
1-2: 안들어간다면 현재 박스를 닫는다. 이후 이 박스는 쓰지 못한다. 다음 박스로 넘어가서 1번 행동으로 돌아간다
 */