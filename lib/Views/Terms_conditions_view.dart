import 'package:flutter/material.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0F172A);
    const Color wineRed = Color(0xFF7A1C2E);

    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco para toda la pantalla
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [darkBlue, wineRed],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: const Text(
          'Términos y Condiciones',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      // SafeArea protege el área inferior respetando los botones/gestos del celular
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24.0), // 👈 Sin padding horizontal para ocupar todo el ancho
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 👈 Estira todos los hijos a todo el ancho disponible
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding opcional pequeño para que el texto no toque el borde del cristal si lo deseas (o ponlo en 0.0 para borde a borde total)
                child: Text(
                  'Términos y Condiciones de Uso',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'El acceso y uso de DniPeru.com implica la aceptación de los presentes Términos y Condiciones. Si no estás de acuerdo con ellos, te recomendamos no utilizar las herramientas de consulta disponibles en el sitio.',
                  style: TextStyle(fontSize: 13, height: 1.5, color: Color(0xFF334155)),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 16),

              _buildSectionTitle('1. Finalidad del sitio'),
              _buildParagraph(
                  'DniPeru.com es un sitio web privado e independiente que proporciona herramientas de consulta con fines informativos.\n'
                      'DniPeru.com no pertenece, representa ni mantiene afiliación oficial con RENIEC, SUNAT, ONPE ni con ninguna otra entidad pública del Estado peruano.\n'
                      'Las consultas realizadas en este sitio no constituyen certificaciones, constancias ni documentos oficiales.'
              ),

              _buildSectionTitle('2. Uso aceptable del sitio'),
              _buildParagraph(
                  'Las herramientas de DniPeru.com están destinadas a consultas individuales y para fines lícitos.\n'
                      'Queda prohibido utilizar el sitio o la información obtenida mediante sus herramientas para:\n'
                      '• Acosar, amenazar, discriminar o perjudicar a otras personas.\n'
                      '• Suplantar la identidad de terceros.\n'
                      '• Realizar actividades fraudulentas o contrarias a la legislación vigente.\n'
                      '• Realizar scraping, consultas automatizadas, extracción masiva de información o utilizar bots u otros mecanismos similares.\n'
                      '• Intentar eludir las medidas de seguridad, límites de consultas o mecanismos de protección implementados en el sitio.\n'
                      '• Generar cargas excesivas o realizar acciones que puedan afectar la disponibilidad o funcionamiento del servicio.\n\n'
                      'Nos reservamos el derecho de restringir temporal o permanentemente el acceso cuando detectemos un uso abusivo, automatizado o contrario a estos términos.'
              ),

              _buildSectionTitle('3. Información mostrada'),
              _buildParagraph(
                  'Los resultados presentados mediante las herramientas de consulta son obtenidos a través de APIs, proveedores y servicios externos de terceros.\n'
                      'DniPeru.com no crea ni administra las bases de datos originales utilizadas por dichos servicios y no puede garantizar que la información proporcionada sea siempre exacta, completa, actualizada o disponible.\n'
                      'Los resultados tienen carácter exclusivamente referencial e informativo.\n'
                      'Cuando necesites información oficial o certificada, deberás acudir directamente a la entidad correspondiente.'
              ),

              _buildSectionTitle('4. Datos incorrectos o desactualizados'),
              _buildParagraph(
                  'DniPeru.com no puede modificar, corregir ni rectificar directamente la información contenida en las bases de datos o servicios externos utilizados para realizar las consultas.\n'
                      'Si consideras que un dato es incorrecto o se encuentra desactualizado, la rectificación deberá solicitarse ante la entidad o proveedor responsable de la fuente original.\n'
                      'Sin embargo, si eres titular de la información, puedes solicitar que tus datos dejen de mostrarse en DniPeru.com mediante nuestra sección Eliminar datos.\n'
                      'La exclusión realizada en DniPeru.com no modifica ni elimina la información existente en las fuentes o bases de datos externas.'
              ),

              _buildSectionTitle('5. Responsabilidad del usuario'),
              _buildParagraph(
                  'El usuario es responsable del uso que realice de la información obtenida mediante DniPeru.com.\n'
                      'El acceso a determinada información a través del sitio no autoriza al usuario a utilizarla de manera ilícita, abusiva o contraria a los derechos de otras personas.'
              ),

              _buildSectionTitle('6. Limitación de responsabilidad'),
              _buildParagraph(
                  'DniPeru.com no será responsable por errores, información desactualizada, diferencias, interrupciones o indisponibilidad de los datos proporcionados por servicios externos.\n'
                      'Asimismo, no nos responsabilizamos por daños derivados del uso indebido que los usuarios puedan realizar de la información obtenida mediante el sitio.'
              ),

              _buildSectionTitle('7. Disponibilidad del servicio'),
              _buildParagraph(
                  'No garantizamos que DniPeru.com o sus herramientas de consulta se encuentren disponibles de forma permanente o ininterrumpida.\n'
                      'Algunas funcionalidades dependen de servicios, APIs e infraestructura proporcionados por terceros, por lo que pueden producirse interrupciones, limitaciones o cambios ajenos a nuestro control.\n'
                      'Podemos modificar, suspender o retirar temporalmente determinadas herramientas cuando resulte necesario por razones técnicas, de seguridad, mantenimiento o cambios en los servicios utilizados.'
              ),

              _buildSectionTitle('8. Propiedad intelectual'),
              _buildParagraph(
                  'Los contenidos propios de DniPeru.com, incluyendo textos, artículos, diseño, elementos gráficos y código desarrollado para el sitio, están protegidos por la normativa aplicable sobre propiedad intelectual.\n'
                      'No está permitida su reproducción, distribución o utilización no autorizada, especialmente mediante mecanismos automatizados o con fines de explotación de contenido.'
              ),

              _buildSectionTitle('9. Privacidad y protección de datos'),
              _buildParagraph(
                  'El tratamiento de datos personales relacionado con el funcionamiento del sitio se encuentra explicado en nuestra Política de Privacidad.\n'
                      'Las solicitudes para que determinada información deje de mostrarse en el sitio pueden realizarse mediante la sección Eliminar datos.'
              ),

              _buildSectionTitle('10. Modificaciones de estos términos'),
              _buildParagraph(
                  'DniPeru.com puede actualizar estos Términos y Condiciones cuando se produzcan cambios en el funcionamiento del sitio, los servicios utilizados o la normativa aplicable.'
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: SizedBox(
        width: double.infinity, // 👈 Fuerza el ancho completo
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
      ),
    );
  }

  Widget _buildParagraph(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity, // 👈 Fuerza el ancho completo
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 13,
            height: 1.5,
            color: Color(0xFF475569),
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}