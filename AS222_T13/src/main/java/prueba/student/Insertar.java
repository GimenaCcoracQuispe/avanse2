package prueba.student;

import Maestros.student;
import Modelos.ModeloStudent;

public class Insertar {

	public static void main(String[] args) {
		try {
			ModeloStudent bean = new ModeloStudent("juaquin", "bot", "DNI", "22222212", "juaquin@gmail.com", "922222122", "2", "A");
			student student = new student();
			student.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
