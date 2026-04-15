@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View: Viagem (Pai)'
define root view entity Z_I_RAP_VIAGEM
  as select from zrap_viagem
  composition [0..*] of Z_I_RAP_ITEM_VIAGEM as _Itens
{
  key viagem_uuid,
      viagem_id,
      descricao,
      status_aprovacao,

      // Agora lemos direto da tabela, sem o CASE!
      criticidade,

      @Semantics.amount.currencyCode: 'moeda'
      valor_total,

      // Agora lemos direto da tabela, sem o CAST!
      @Semantics.amount.currencyCode: 'moeda'
      orcamento_maximo,

      moeda,

      // Campos administrativos (O SAP gerencia via @Semantics)
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at,

      // Expondo a associação para a view filha
      _Itens
}
