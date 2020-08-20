public class Test1 {
    public static void main(String[] args) {
        String wv="0.0622477";
        String up="0.06";
        String down="0";
        System.out.println(Float.parseFloat(wv));
        System.out.println(Float.parseFloat(up));
        System.out.println(Float.parseFloat(wv)>Float.parseFloat(up));
        if((down!=null&&wv!=null&&
                Float.parseFloat(String.valueOf(wv))<Float.parseFloat(String.valueOf(down)))||
                (up!=null&&wv!=null&&
                        Float.parseFloat(String.valueOf(wv))>Float.parseFloat(String.valueOf(up)))) {
            System.out.println("11111111111111111111111111");
        }
    }
}
