import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Inseririmagem {
    public static void main(String[] args) {
        try (Connection conexao = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/seubanco?user=usuario&password=Senha")) {

            String sql = "INSERT INTO imagem (id_imagem, dados_imagem) VALUES (?, ?)";
            PreparedStatement stmt = conexao.prepareStatement(sql);

            // Configurar os valores
            stmt.setString(1,  "Teste.jpg");

            File arquivoImagem = new File("Seucaminho\\Teste.jpg");
            FileInputStream fis = new FileInputStream(arquivoImagem);
            stmt.setBinaryStream(2, fis, (int) arquivoImagem.length());

            // Executar a inserção
            stmt.executeUpdate();
            System.out.println("Imagem inserida com sucesso!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
