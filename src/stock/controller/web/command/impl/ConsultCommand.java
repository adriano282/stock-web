package stock.controller.web.command.impl;

import stock.core.application.Result;
import domain.DomainEntity;

public class ConsultCommand extends AbstractCommand{

	public Result execute(DomainEntity entity, Integer page, Integer recordsPerPage) {
		return facade.consult(entity, page, recordsPerPage);
	}

	@Override
	public Result execute(DomainEntity entity) {
		// TODO Auto-generated method stub
		return null;
	}

}
