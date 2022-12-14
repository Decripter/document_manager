import 'package:cpf_generator/app/document_manager/models/cpf_document_model.dart';
import 'package:cpf_generator/app/document_manager/models/document_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DocumentModel cpfManager = CPFDocumentModel('');

  group('Tests of cpfValidator function', () {
    test('shoud return false if is empty', () {
      var isValid = cpfManager.validateDocument('');
      expect(isValid, false);
    });

    test('should return false if the cpf.length < 11', () {
      var isValid = cpfManager.validateDocument('1234567890'); //cpf.length = 10
      expect(isValid, false);
    });
    test('should return false if the cpf.length > 11', () {
      var isValid =
          cpfManager.validateDocument('123456789012'); //cpf.length = 12
      expect(isValid, false);
    });

    test('should return true when the cpf is valid(11144477735)', () {
      var isValid = cpfManager.validateDocument('11144477735');
      expect(isValid, true);
    });

    test('should return false when the cpf is invalid(57435863010)', () {
      var isValid = cpfManager.validateDocument('57435863010');
      expect(isValid, false);
    });
  });

  group('Tests of cpfGenerator function', () {
    test('Should return a valid cpf', (() {
      var cpf = cpfManager.documentGenerator();
      var isValid = cpfManager.validateDocument(cpf);
      expect(isValid, true);
    }));
  });
}
