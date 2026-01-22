package boj.Q13565;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Queue;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        final BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        StringTokenizer st = new StringTokenizer(br.readLine());
        int M = Integer.parseInt(st.nextToken());
        int N = Integer.parseInt(st.nextToken());

        final int[][] grid = new int[M][N];
        for (int i = 0; i < M; i++) {
            final String line = br.readLine();
            for (int j = 0; j < N; j++) {
                grid[i][j] = line.charAt(j) - '0';
            }
        }

        Queue<Pair> que = new ArrayDeque<>();
        boolean[][] visited = new boolean[M][N];
        final int[] dx = new int[]{1, 0, -1, 0};
        final int[] dy = new int[]{0, 1, 0, -1};

        for (int i = 0; i < N; i++) {
            if (grid[0][i] == 0) {
                que.offer(new Pair(0, i));
                visited[0][i] = true;
            }
        }

        boolean result = false;

        while (!que.isEmpty()) {
            final Pair current = que.poll();

            if (current.x == M - 1) {
                result = true;
                break;
            }

            for (int i = 0; i < 4; i++) {
                final int nextX = current.x + dx[i];
                final int nextY = current.y + dy[i];

                if (nextX >= 0 && nextX < M && nextY >= 0 && nextY < N) {
                    if (!visited[nextX][nextY] && grid[nextX][nextY] == 0) {
                        visited[nextX][nextY] = true;
                        que.offer(new Pair(nextX, nextY));
                    }
                }
            }
        }

        System.out.println(result ? "YES" : "NO");
    }

    static class Pair {
        int x, y;

        public Pair(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }
}

