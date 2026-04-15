@EndUserText.label: 'Projection View: Viagem'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity Z_C_RAP_VIAGEM
  provider contract transactional_query
  as projection on Z_I_RAP_VIAGEM
{
  key viagem_uuid,
      viagem_id,
      descricao,
      status_aprovacao,

      criticidade,
      valor_total,
      orcamento_maximo,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
      moeda,
      created_by,
      created_at,
      last_changed_by,
      last_changed_at,
      local_last_changed_at,

      /* Redirecionando a Associação para a view de consumo filha */
      _Itens : redirected to composition child Z_C_RAP_ITEM_VIAGEM
}
