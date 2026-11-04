import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

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
          'Política de Privacidad',
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
          padding: const EdgeInsets.symmetric(vertical: 24.0), // 👈 Sin padding lateral global para ocupar todo el ancho
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 👈 Estira los elementos al ancho completo
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Política de Privacidad',
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
                  'En DniPeru.com respetamos la privacidad de las personas y procuramos realizar el tratamiento de datos personales de conformidad con la Ley N.º 29733 – Ley de Protección de Datos Personales, su Reglamento aprobado mediante Decreto Supremo N.º 016-2024-JUS y demás normativa aplicable.',
                  style: TextStyle(fontSize: 13, height: 1.5, color: Color(0xFF334155)),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 16),

              _buildSectionTitle('1. ¿Qué datos podemos tratar?'),
              _buildParagraph(
                  'DniPeru.com no mantiene una base de datos propia destinada a almacenar permanentemente los resultados obtenidos mediante las consultas realizadas por los usuarios.\n\n'
                      'Sin embargo, para el funcionamiento del sitio pueden tratarse determinados datos, entre ellos:\n'
                      '• Datos ingresados voluntariamente en las herramientas de consulta, como DNI, nombres u otros datos necesarios para realizar la búsqueda solicitada.\n'
                      '• Datos proporcionados mediante formularios de contacto o solicitudes relacionadas con datos personales.\n'
                      '• Información técnica necesaria para la seguridad y funcionamiento del sitio, como dirección IP, tipo de navegador, dispositivo, registros técnicos y mecanismos destinados a prevenir abusos o consultas automatizadas.\n'
                      '• Cookies e identificadores utilizados por servicios de publicidad y tecnologías de terceros.\n\n'
                      'Los datos introducidos en las herramientas de consulta pueden ser procesados temporalmente y enviados a servicios o APIs externas para obtener el resultado solicitado.'
              ),

              _buildSectionTitle('2. Finalidad del tratamiento'),
              _buildParagraph(
                  'Los datos tratados mediante DniPeru.com pueden ser utilizados para las siguientes finalidades:\n'
                      '• Procesar las consultas solicitadas por los usuarios.\n'
                      '• Mostrar los resultados proporcionados por servicios externos.\n'
                      '• Proteger la seguridad y disponibilidad del sitio.\n'
                      '• Prevenir consultas automatizadas, scraping, fraude, abuso u otras actividades que puedan afectar el servicio.\n'
                      '• Atender solicitudes relacionadas con datos personales.\n'
                      '• Mantener la exclusión de información cuando un titular haya solicitado que sus datos dejen de mostrarse en DniPeru.com.\n'
                      '• Gestionar y mostrar publicidad mediante servicios de terceros.'
              ),

              _buildSectionTitle('3. Tratamiento de las consultas'),
              _buildParagraph(
                  'Cuando un usuario introduce información en una herramienta de consulta, DniPeru.com puede transmitir los datos necesarios a APIs, proveedores o servicios externos para obtener la información solicitada.\n'
                      'DniPeru.com no crea ni administra las bases de datos originales consultadas mediante dichos servicios.\n'
                      'Los resultados obtenidos tienen carácter exclusivamente referencial e informativo y no constituyen certificaciones, constancias ni documentos oficiales.'
              ),

              _buildSectionTitle('4. Base para el tratamiento de datos'),
              _buildParagraph(
                  'El tratamiento de datos personales se realiza de acuerdo con los supuestos permitidos por la Ley N.º 29733, su Reglamento y demás normativa aplicable.\n'
                      'Cuando para un determinado tratamiento resulte necesario obtener el consentimiento del titular, este deberá ser solicitado conforme a las condiciones establecidas por la normativa vigente.'
              ),

              _buildSectionTitle('5. Origen y exactitud de la información'),
              _buildParagraph(
                  'La información mostrada mediante las herramientas de consulta es obtenida a través de APIs, proveedores y servicios externos de terceros.\n'
                      'DniPeru.com no controla las bases de datos originales utilizadas por estos servicios y no puede garantizar que la información proporcionada se encuentre permanentemente actualizada, completa o libre de errores.\n'
                      'Asimismo, DniPeru.com no puede modificar, corregir o rectificar directamente la información existente en las bases de datos externas.\n'
                      'Si un dato es incorrecto o se encuentra desactualizado en la fuente original, su rectificación deberá solicitarse ante la entidad o proveedor responsable de dicha información.'
              ),

              _buildSectionTitle('6. Solicitud para dejar de mostrar datos'),
              _buildParagraph(
                  'Si eres titular de información personal mostrada mediante las herramientas de DniPeru.com, puedes solicitar que tus datos dejen de visualizarse en este sitio mediante nuestra sección Eliminar datos.\n'
                      'Una vez aprobada la solicitud, podremos aplicar las medidas técnicas necesarias para evitar que dicha información vuelva a mostrarse mediante nuestras herramientas de consulta.\n'
                      'Para mantener esta exclusión, podrá conservarse únicamente la información mínima necesaria para identificar el registro y evitar que vuelva a ser mostrado.\n'
                      'La exclusión realizada por DniPeru.com afecta exclusivamente a la visualización de información dentro de este sitio y no modifica ni elimina los datos existentes en RENIEC, otras entidades, proveedores, APIs o bases de datos externas.'
              ),

              _buildSectionTitle('7. Derechos sobre los datos personales'),
              _buildParagraph(
                  'De acuerdoกับการ legislación peruana, los titulares de datos personales pueden ejercer los derechos de Acceso, Rectificación, Cancelación y Oposición (ARCO), cuando correspondan.\n'
                      'En particular:\n'
                      '• Acceso: permite conocer qué datos personales son tratados y las condiciones de dicho tratamiento.\n'
                      '• Rectificación: permite solicitar la corrección de datos inexactos o incompletos cuando estos puedan ser modificados por quien realiza el tratamiento.\n'
                      '• Cancelación: permite solicitar que determinados datos dejen de ser tratados cuando corresponda conforme a la normativa.\n'
                      '• Oposición: permite oponerse al tratamiento de datos personales en los supuestos previstos por la legislación.\n\n'
                      'Cuando una solicitud de rectificación se refiera a información procedente de una base de datos externa que DniPeru.com no puede modificar, se informará de dicha circunstancia al solicitante. Cuando corresponda, podrá solicitarse en su lugar que la información deje de mostrarse en DniPeru.com.\n'
                      'Las solicitudes relacionadas con la visualización de información pueden realizarse mediante nuestra sección Eliminar datos.\n'
                      'Para proteger al titular de los datos, podremos solicitar información razonablemente necesaria para verificar la identidad del solicitante.'
              ),

              _buildSectionTitle('8. Conservación de datos'),
              _buildParagraph(
                  'DniPeru.com no está destinado a conservar permanentemente los resultados generados mediante sus herramientas de consulta.\n'
                      'No obstante, determinados datos pueden conservarse durante el tiempo necesario para:\n'
                      '• Atender solicitudes realizadas por los usuarios.\n'
                      '• Mantener una exclusión solicitada por el titular de los datos.\n'
                      '• Prevenir abusos y proteger la seguridad del sitio.\n'
                      '• Cumplir obligaciones legales cuando resulte aplicable.\n\n'
                      'La información proporcionada para solicitar que determinados datos dejen de mostrarse será utilizada únicamente para gestionar y mantener dicha solicitud.'
              ),

              _buildSectionTitle('9. Cookies y Google AdSense'),
              _buildParagraph(
                  'DniPeru.com utiliza o puede utilizar cookies y tecnologías similares necesarias para el funcionamiento, seguridad y publicidad del sitio.\n'
                      'Asimismo, utilizamos Google AdSense para mostrar publicidad.\n'
                      'Google y sus socios tecnológicos pueden utilizar cookies, direcciones IP, identificadores del navegador y otras tecnologías para mostrar, gestionar y medir anuncios.\n'
                      'Dependiendo de la configuración disponible, las preferencias del usuario y los requisitos aplicables, los anuncios pueden ser personalizados o no personalizados.\n'
                      'Los usuarios pueden gestionar determinadas cookies y tecnologías similares mediante la configuración de su navegador y las herramientas de privacidad o consentimiento que correspondan.'
              ),

              _buildSectionTitle('10. Servicios de terceros'),
              _buildParagraph(
                  'DniPeru.com utiliza proveedores y servicios externos necesarios para proporcionar determinadas funcionalidades, incluyendo servicios de consulta mediante APIs, infraestructura, seguridad y publicidad.\n'
                      'Estos proveedores pueden tratar información de acuerdo con sus propias políticas de privacidad y obligaciones legales.\n'
                      'DniPeru.com no controla las políticas, bases de datos ni sistemas internos administrados directamente por dichos proveedores.'
              ),

              _buildSectionTitle('11. Seguridad'),
              _buildParagraph(
                  'DniPeru.com implementa medidas técnicas razonables destinadas a proteger el funcionamiento del sitio, prevenir accesos no autorizados, limitar consultas abusivas y reducir riesgos relacionados con el tratamiento de información.\n'
                      'No obstante, ningún sistema conectado a Internet puede garantizar una seguridad absoluta.'
              ),

              _buildSectionTitle('12. Contacto'),
              _buildParagraph(
                  'Para consultas relacionadas con esta Política de Privacidad puedes comunicarte mediante:\n'
                      '📧 Correo: dniperu@outlook.es\n\n'
                      'Si deseas solicitar que tus datos dejen de mostrarse mediante las herramientas de consulta, utiliza preferentemente nuestra sección Eliminar datos.'
              ),

              _buildSectionTitle('13. Cambios en esta Política de Privacidad'),
              _buildParagraph(
                  'DniPeru.com puede actualizar esta Política de Privacidad cuando se produzcan cambios en el funcionamiento del sitio, los servicios utilizados o la normativa aplicable.\n'
                      'La versión publicada en esta página será la vigente en cada momento.'
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
        width: double.infinity, // 👈 Ancho completo
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
        width: double.infinity, // 👈 Ancho completo
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