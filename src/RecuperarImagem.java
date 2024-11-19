import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RecuperarImagem {
    public static void main(String[] args) {
        // Dados de conexão com o banco
        String url = "jdbc:mysql://localhost:3306/seubanco";
        String usuario = "usuario";
        String senha = "senha";

        try (Connection conexao = DriverManager.getConnection(url, usuario, senha)) {
            // SQL para recuperar a imagem
            String sql = "SELECT id_imagem, dados_imagem FROM imagens WHERE id = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);

            // Especificar o ID da imagem que deseja recuperar
            int idImagem = 1;
            stmt.setInt(1, idImagem);

            // Executar a consulta
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Obter o nome do arquivo e os dados da imagem
                String nomeImagem = rs.getString("nome");
                InputStream dadosImagem = rs.getBinaryStream("dados");

                // Criar o arquivo local para salvar a imagem
                try (FileOutputStream fos = new FileOutputStream("recuperada_" + nomeImagem)) {
                    byte[] buffer = new byte[1024];
                    int bytesLidos;

                    while ((bytesLidos = dadosImagem.read(buffer)) != -1) {
                        fos.write(buffer, 0, bytesLidos);
                    }

                    System.out.println("Imagem recuperada e salva como 'recuperada_" + nomeImagem + "'");
                }
            } else {
                System.out.println("Imagem não encontrada no banco.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}